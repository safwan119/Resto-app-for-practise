import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

class ShowPicture extends StatefulWidget {
  @override
  State<ShowPicture> createState() => _ShowPictureState();
}

class _ShowPictureState extends State<ShowPicture> {
  String guestcount = "1";
  var gustno = TextEditingController();
  var index1 = 1;
  var itemIndex = 0;
  // bool isCheckBox=false;
  String flavour="original";
  
  List<Map<String, dynamic>> FoodList1 = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegeterian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<Map<String, dynamic>> Menu1 = [
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
    {
      "title": "Laksa Johor",
      "subtitle": "A speciality of Malaysian island of penag..",
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Mcdonald's-Seri Austin DT",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TimeDateCard(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.do_not_disturb_alt_sharp),
                    // SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "At the moment there is no availability for today. The next availability for 3 guests is tomorrow",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: FoodList1.length,
                  itemBuilder: (context, index) {
                    String title = FoodList1[index]["title"];
                    Color color = index == 0 ? Colors.amber : Colors.black12;
                    return CountryFood1(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Menu1.isNotEmpty
                    ? GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children:Menu1.map((item) {
                    return FoodMenu1(item['title'], item['subtitle']);
                  }).toList(),
                )
                    : Text("No result found"),
              ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 8,
                      child:Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    right: 0,
                                    top: 15,
                                    child: IconButton(
                                        style:IconButton.styleFrom(backgroundColor: Colors.white,

                                            shape: CircleBorder()
                                        ) ,
                                        onPressed: (){
                                          Navigator.pop(context);
                                        }, icon: Icon(Icons.close,size: 20,grade: 12,)),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Text("Laksa Johor",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              trailing: Text("RM 18:30",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(alignment: Alignment.centerLeft,
                                  child: Text("A specialty of the Malaysian Island of penang.the soup is made with mackerel and authentic taste.")),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Flavour",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
                            ),
                            RadioListTile(
                              activeColor: Colors.blue,
                              title: Text("Original"),
                                value: "original", groupValue: flavour
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                                }),
                            RadioListTile(
                                activeColor: Colors.blue,
                                title: Text("Medium"),
                                value: "original", groupValue: null
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                            }),
                            RadioListTile(
                                activeColor: Colors.blue,
                                title: Text("Mix(Original and Spicy only)"),
                                value: "original", groupValue: null
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                            }),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Spices",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
                            ),
                            RadioListTile(
                                activeColor: Colors.blue,
                                title: Text("Spicy"),
                                value: "original", groupValue: flavour
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                            }),
                            RadioListTile(
                                activeColor: Colors.blue,
                                title: Text("Spicier"),
                                value: "original", groupValue: null
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                            }),
                            RadioListTile(
                                activeColor: Colors.blue,
                                title: Text("Extra Spicy"),
                                value: "original", groupValue: null
                                , onChanged: (value){
                              setState(() {
                                flavour=value.toString();
                              });
                            }),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 20),
                               child: Card(
                                 elevation: 6,
                                 child: InkWell(onTap: (){},
                                   child: Container(
                                     height: 40,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                       color: Colors.amber,
                                     ),
                                     child: Center(child: Text("Add to Card")),
                                   ),
                                 ),
                               ),
                             ),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class CountryFood1 extends StatelessWidget {
  String? title;
  Color? colors;

  CountryFood1(this.title, this.colors);

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
class FoodMenu1 extends StatelessWidget {
  String? title;
  String? subtitle;
  FoodMenu1(this.title, this.subtitle);
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
