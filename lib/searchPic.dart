import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';

class SearchPicture extends StatefulWidget{
  @override
  State<SearchPicture> createState() => _SearchPictureState();
}

class _SearchPictureState extends State<SearchPicture> {
  var Search=TextEditingController();
  var itemIndex=0;
  String srch="";
  List<Map<String, dynamic>> FoodList = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegeterian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<Map<String, dynamic>> Menu = [
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
  ];
  List<Map<String, dynamic>> FilterMenuFood = [];

  @override
  void initState() {
    super.initState();
    FilterMenuFood = List.from(Menu);
  }

  void FilterSearch() {
    setState(() {
      FilterMenuFood = srch.isEmpty
          ? List.from(Menu)
          : Menu.where(
            (item) => item['title'].toString().toLowerCase().contains(
          srch.toLowerCase(),
        ),
      ).toList();
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Mcdonald's-Seri Austin DT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Container(
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
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 13,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: Image.asset("assets/image/picture.jpg",
                  fit: BoxFit.cover,
                  ),

                ),
              ),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: FoodList.length,
                  itemBuilder: (context, index) {
                    String title = FoodList[index]["title"];
                    Color color = index == 5 ? Colors.amber : Colors.black12;
                    return CountryFood2(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
           SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FilterMenuFood.isNotEmpty
                  ? GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: FilterMenuFood.map((item) {
                  return FoodMenu2(item['title'], item['subtitle']);
                }).toList(),
              )
                  : Text("No result found"),
            ),

            SizedBox(height: 100,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child:FilterMenuFood.isNotEmpty? Card(elevation: 4,
                 child: InkWell(
                   child: Container(
                     width: double.infinity,
                     height: 40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(13),
                       color: Colors.amber,
                     ),
                     child:Row(
                       children: [
                         SizedBox(width: 30,),
                         Text("Proceeds to Booking",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                         Spacer(),
                         Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: Text("RM 49.20",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                         ),
                       ],
                     )
                   ),
                   onTap: (){},
                 ),
               ):Container(),
             ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
class CountryFood2 extends StatelessWidget {
  String? title;
  Color? colors;

  CountryFood2(this.title, this.colors);

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
        child: Center(child: Text(title!,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}
class FoodMenu2 extends StatelessWidget {
  String? title;
  String? subtitle;
  FoodMenu2(this.title, this.subtitle);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: SingleChildScrollView(
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/image/picture.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(subtitle!, style: TextStyle(color: Colors.black)),
                  Row(
                    children: [
                      Text(
                        "RM 17.00",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.add_box, size: 20, color: Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}