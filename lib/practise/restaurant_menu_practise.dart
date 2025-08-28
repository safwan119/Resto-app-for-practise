import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../firestore/adding_firestore_database.dart';

class RestaurantMenuPractise extends StatefulWidget {
  const RestaurantMenuPractise({super.key});

  @override
  State<RestaurantMenuPractise> createState() => _RestaurantMenuPractiseState();
}

class _RestaurantMenuPractiseState extends State<RestaurantMenuPractise> {
  final dbRef = FirebaseDatabase.instance.ref("Restaurant");
  final search = TextEditingController();
  List<dynamic> originalList = [];
  List<dynamic> filteredList = [];
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredList = originalList.where((restaurant) {
        return restaurant["title"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_outlined),
                ),
                Text("Restaurant Menu"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search for restaurant",
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                  onChanged: (value) => filterSearchResults(value),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: dbRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Some error");
          }
          if (!snapshot.hasData) {
            return Text("No data");
          }
          if (snapshot.hasData && !_initialized) {
            final map = snapshot.data!.snapshot.value as Map;
            originalList = map.values.toList();
            filteredList = List.from(originalList);
            _initialized = true;
          }
          return filteredList.isNotEmpty
              ? ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    String imageUrl =
                        filteredList[index]["image"] ??
                        "https://example.com/placeholder.png";
                    return Card(
                      elevation: 6,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 135,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Text('Image not found'),
                                      ); // Display if image fails to load
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    filteredList[index]["title"] ??
                                        "Not Specified",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    filteredList[index]["subtitle"] ??
                                        "Not Specified",
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),
                                      SizedBox(width: 12),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ". ${filteredList[index]["halalOrNonHalal"] ?? "Not Specified"}",
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Container(child: Center(child: Text("No data found")));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddingFirestoreDatabase()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
