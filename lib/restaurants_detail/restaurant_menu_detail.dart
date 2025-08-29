import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';

import '../firebase_database/restaurant_firebase_database.dart';

class RestaurantMenuDetail extends StatefulWidget {
  const RestaurantMenuDetail({super.key});

  @override
  State<RestaurantMenuDetail> createState() => _RestaurantMenuPractiseState();
}

class _RestaurantMenuPractiseState extends State<RestaurantMenuDetail> {
  final dbRef = FirebaseDatabase.instance.ref("Restaurant");
  final Search = TextEditingController();
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
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,Aiman",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "Let's Make a Flash Order",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for restaurant",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => filterSearchResults(value),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: StreamBuilder(
          stream: dbRef.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
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
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Center(
                                              child: Text('Image not found'),
                                            );
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
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.sentiment_dissatisfied_rounded, size: 50),
                          Text(
                            "We couldn't found any result",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Try for different search keyword or look for your\n favorite dish at another restaurant",
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
