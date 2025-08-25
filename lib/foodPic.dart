import 'package:flutter/material.dart';
import 'package:my_first_proj/seperateImagfood.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';
import 'drawer/drawer.dart';

class FoodPicture extends StatefulWidget {
  const FoodPicture({super.key});

  @override
  State<FoodPicture> createState() => _FoodPictureState();
}

class _FoodPictureState extends State<FoodPicture> {
  var Search = TextEditingController();
  String srch = "";
  List<Map<String, dynamic>> menu = [
    {
      "title": "Legend Vicious Cafe House",
      "subtitle": "210-Km away -Pick up in 15 min",
      "image": "assets/image/image.png",
    },
    {
      "title": "RZ Restaurant",
      "subtitle": "242-Km away -Pick up in 15 min",
      "image": "assets/image/rz_restouran.jpg",
    },
  ];
  List<Map<String, dynamic>> FilterMenu = [];

  @override
  void initState() {
    super.initState();
    FilterMenu = List.from(menu);
  }

  void updateFilterMenu() {
    setState(() {
      FilterMenu = srch.isEmpty
          ? List.from(menu)
          : menu
                .where(
                  (item) => item['title'].toString().toLowerCase().contains(
                    srch.toLowerCase(),
                  ),
                )
                .toList();
    });
  }

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
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_outlined)),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: Search,
                  onChanged: (String value) {
                    srch = value;
                    updateFilterMenu();
                  },
                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),

      body: FilterMenu.isNotEmpty
          ? ListView.builder(
              itemCount: FilterMenu.length,
              itemBuilder: (context, index) {
                String title = FilterMenu[index]["title"];
                String subtitle = FilterMenu[index]["subtitle"];
                String image = FilterMenu[index]["image"];
                return FoodMenu(
                  title: title,
                  subtitle: subtitle,
                  picture: image,
                );
              },
            )
          : Container(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.sentiment_dissatisfied_rounded,size: 50,),
              Text("We couldn't found any result",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
              Text("Try for different search keyword or look for your\n favorite dish at another restaurant")
            ],
          ))),
    );
  }
}

class FoodMenu extends StatelessWidget {
  String? title;
  String? subtitle;
  String? picture;

  FoodMenu({this.title, this.subtitle, this.picture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SepearImag()));
      },
        child: Card(
          elevation: 6,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 135,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(picture!, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(subtitle!),
                    SizedBox(height: 20),
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
                        Text(". Halal"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

