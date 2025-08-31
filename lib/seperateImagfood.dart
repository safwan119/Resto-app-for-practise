import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/asian_food_menu/asian_menu.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/bkTabl.dart';
import 'package:my_first_proj/firebase_database/menu_database.dart';
import 'package:my_first_proj/searchPic.dart';
import 'package:my_first_proj/review.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';
import 'drawer/drawer.dart';
import 'firebase_database/food_menu_database.dart';
import 'menu/menu.dart';

class FoodMenu2 {
  double? price;
  String? title;
  String? description;
  String? imagePath;

  FoodMenu2({
    required this.price,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class SepearImag extends StatefulWidget {
  @override
  State<SepearImag> createState() => _SepearImagState();
}

class _SepearImagState extends State<SepearImag> {
  final databaseReference = FirebaseDatabase.instance.ref("Restaurant Detail");
  final databaseRef1 = FirebaseDatabase.instance.ref("Restaurant Menu");
  var search = TextEditingController();
  List<Map<String, dynamic>> foodList = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegetarian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<dynamic> originalList = [];
  List<dynamic> filteredList = [];
  bool _initialized = false;

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
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
                Expanded(
                  child: Text(
                    "Mcdonald's-Seri Austin DT",
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: search,
                  onChanged: (value) => filterSearchResults(value),
                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Icon(Icons.search, size: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuDatabase()),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data is available"));
          }
          final data = Map<String, dynamic>.from(
            snapshot.data!.snapshot.value as Map,
          );
          final firstKey = data.values.first;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.network(
                          firstKey["image"] ??
                              "https://example.com/placeholder.png",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image: $error');
                            return Center(
                              child: Text(
                                'Image not available',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,

                      left: 10,
                      right: 10,
                      child: Card(
                        elevation: 8,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                    ),
                                    child: Text(
                                      firstKey["Name"] ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookTable(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Divider(color: Colors.black),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text("4.9"),
                                  SizedBox(width: 8),
                                  Text(
                                    "View Ratings and Reviews",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReviewProducts(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Divider(color: Colors.black),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Icon(
                                      Icons.directions_walk,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text("3km away"),
                                  SizedBox(width: 8),
                                  Text(
                                    "(Pick up in 15 mins)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Colors.black),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: "Complete your reservation detail"),
                      TextSpan(
                        text: "(Required)",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TimeDateCard(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(Icons.not_interested_rounded, color: Colors.black),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "At the moment there is no availability for today. The next availability for 3 guests is tomorrow",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        firstKey["image1"] ?? " ",
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodList.length,
                      itemBuilder: (context, index) {
                        String title = foodList[index]["title"];
                        Color color = index == 0
                            ? Colors.amber
                            : Colors.black12;
                        return CountryFood(title, color);
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      StreamBuilder(
                        stream: databaseRef1.onValue,
                        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (!snapshot.hasData) {
                            return Text("No data available");
                          }
                          if (snapshot.hasData && !_initialized) {
                            final map = snapshot.data!.snapshot.value as Map;
                            originalList = map.values.toList();
                            filteredList = List.from(originalList);
                            _initialized = true;
                          }
                          return filteredList.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: GridView.builder(
                                    itemCount: filteredList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 250,
                                          mainAxisExtent: 280,
                                          childAspectRatio: 0.75,
                                          crossAxisSpacing: 11.0,
                                          mainAxisSpacing: 11.0,
                                        ),
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  filteredList[index]["image"] ??
                                                      " ",
                                                  fit: BoxFit.cover,
                                                  height: 120,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    filteredList[index]["title"] ??
                                                        " ",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    filteredList[index]["desc"] ??
                                                        " ",
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "RM ${filteredList[index]["price"]}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Icon(
                                                        Icons.add_box_sharp,
                                                        color: Colors.amber,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  child: Center(child: Text("No data here")),
                                );
                        },
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Card(
                            elevation: 4,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.amber,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Proceed to booking",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "RM 49.20",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CountryFood extends StatelessWidget {
  String? title;
  Color? colors;

  CountryFood(this.title, this.colors);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colors!,
        overlayColor: Colors.amber,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        if (title == "Asian") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuScreen()),
          );
        } else if (title == "Chinese") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPicture()),
          );
        }
      },
      child: Center(child: Text(title!)),
    );
  }
}
