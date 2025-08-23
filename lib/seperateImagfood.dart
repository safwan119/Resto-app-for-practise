import 'package:flutter/material.dart';

import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/showPic.dart';
import 'package:my_first_proj/bkTabl.dart';
import 'package:my_first_proj/searchPic.dart';
import 'package:my_first_proj/review.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

import 'drawer/drawer.dart';
class FoodMenu2 {
  double? price;
  String? title;
  String? description;
  String? imagePath;

  FoodMenu2(
      {required this.price, required this.title, required this.description, required this.imagePath});
}

class SepearImag extends StatefulWidget {
  @override
  State<SepearImag> createState() => _SepearImagState();
}

class _SepearImagState extends State<SepearImag> {
  String guestcount1 = "1";
  var guestno1 = TextEditingController();
  var itemIndex = 0;
  String srch = "";
  var Search = TextEditingController();
  List<Map<String, dynamic>> FoodList = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegeterian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<FoodMenu2> FoodList2 = [
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu2(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
  ];
  List<FoodMenu2> FilterMenuFood4 = [];

  void initState() {
    super.initState();
    FilterMenuFood4 = List.from(FoodList2);
  }

  void FilterSearch() {
    setState(() {
      FilterMenuFood4 = srch.isEmpty
          ? List.from(FoodList2)
          : FoodList2.where(
            (item) =>
            item.toString().toLowerCase().contains(
              srch.toLowerCase(),
            ),
      ).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mcdonald's-Seri Austin DT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: Search,
                  onChanged: (String value) {
                    srch = value;
                    FilterSearch();
                  },
                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/image/image.jpg",
                      fit: BoxFit.cover,
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
                                  horizontal: 20,
                                ),
                                child: Text(
                                  "McDonald's – Seri Austin DT",
                                  style: TextStyle(
                                    fontSize: 20,
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
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.black),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Icon(Icons.star, color: Colors.amber),
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
                                      builder: (context) => ReviewProducts(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
               child:TimeDateCard(),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 50,
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
                  child: Image.asset(
                    "assets/image/picture.jpg",
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
                  itemCount: FoodList.length,
                  itemBuilder: (context, index) {
                    String title = FoodList[index]["title"];
                    Color color = index == 0 ? Colors.amber : Colors.black12;
                    return CountryFood(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FilterMenuFood4.isNotEmpty ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: FilterMenuFood4.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisExtent: 280,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 11.0,
                          mainAxisSpacing: 11.0
                      ),
                      itemBuilder: (context, index) {
                        return FoodMenuClass1(food: FilterMenuFood4[index],);
                      }) : Container(
                      child: Center(child: Text("No result found"))),
                ),
                Positioned(bottom: 8,
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
                                child: FilterMenuFood4.isNotEmpty ? Text(
                                  "Proceed to booking", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),) : Container(),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("RM 49.20", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
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
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colors!,
          overlayColor: Colors.amber,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Center(child: Text(title!)),
      ),
    );
  }
}
class FoodMenuClass1 extends StatelessWidget {
  final FoodMenu2 food;

  FoodMenuClass1({required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(12),
                child: Image.asset(food.imagePath!, fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.title!, style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 8),
                  Text(food.description!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text("RM ${food.price!}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),),
                      Spacer(),
                      Icon(Icons.add_box_sharp, color: Colors.amber,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}