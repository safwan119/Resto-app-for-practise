import 'package:flutter/material.dart';
import 'package:my_first_proj/showPic.dart';
import 'package:my_first_proj/bkTabl.dart';
import 'package:my_first_proj/searchPic.dart';
import 'package:my_first_proj/review.dart';

import 'drawer/drawer.dart';
class SepearImag extends StatefulWidget {
  @override
  State<SepearImag> createState() => _SepearImagState();
}

class _SepearImagState extends State<SepearImag> {
  String guestcount1="1";
  var guestno1=TextEditingController();
  var itemIndex = 0;
  var Search = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                "Mcdonald's-Seri Austin DT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                // width: 500,
                height: 40,
                child: TextField(
                  controller: Search,

                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Search.text.isEmpty
                        ? Icon(Icons.search, size: 20)
                        : null,

                    // prefixIcon: Icon(Icons.search,size: 20,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9),
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white38,
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,

        onTap: (index) {
          setState(() {
            itemIndex = index;
          });
        },
        currentIndex: itemIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: "Finance",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1400,
              color: Colors.white,// You can adjust this height
              child: Stack(
                children: [
                  // 🖼️ Image Background
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/image/image.jpg",
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 🟨 Overlapping Card
                  Positioned(
                    top: 260, // Controls overlap
                    left: 20,
                    right: 20,
                    child: Container(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          // width: 500,
                          // height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title Row
                                Row(
                                  children: [
                                    Text(
                                      "McDonald's – Seri Austin DT",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookTable()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_sharp,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 1,color: Colors.black,),

                                SizedBox(height: 5),

                                // Rating Row
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text("4.9"),
                                    SizedBox(width: 8),
                                    Text(
                                      "View Ratings and Reviews",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewProducts()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_sharp,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 1,color: Colors.black,),
                                // Text(
                                //   "------------------------------------------------------------------",
                                // ),
                                SizedBox(height: 8),

                                // Distance Row
                                Row(
                                  children: [
                                    Icon(
                                      Icons.directions_walk,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 4),
                                    Text("3km away"),
                                    SizedBox(width: 8),
                                    Text(
                                      "(Pick up in 15 mins)",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 🟩 Rest of UI below the Card
                  Positioned(
                    top: 500,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 220),
                          child: Row(
                            children: [
                              Divider(thickness: 1,color: Colors.black,),
                              Text("Complete your reservation fields"),
                              SizedBox(width: 5),
                              Text(
                                "(Required)",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),

                        // Row with Guests / Date / Time
                        Card(
                          color: Colors.white,
                          elevation: 3,
                          child: Container(
                            // width: 600,
                            // height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Guests
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    width: 190,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text("Guests"),
                                      subtitle: Text(
                                        "${guestcount1} Guests",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        onPressed: (){
                                          showDialog(context: context, builder:(context){
                                            return AlertDialog(
                                              title:Text("Enter the Number of Guests",style: TextStyle(color: Colors.black),) ,
                                              content: TextField(
                                                controller: guestno1,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText: "Enter value"
                                                ),
                                              ),
                                              actions: [

                                                ElevatedButton(
                                                  style:ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                                    onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("Exit",style: TextStyle(color: Colors.black),)),
                                                ElevatedButton(
                                                    style:ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                                    onPressed: (){
                                                      setState(() {
                                                        guestcount1=guestno1.text.toString();
                                                      });
                                                      Navigator.pop(context);
                                                    }, child: Text("Ok",style: TextStyle(color: Colors.black),))
                                              ],
                                            );
                                          });
                                        },
                                          icon: Icon(Icons.arrow_drop_down,)),
                                    ),
                                  ),
                                ),
                                Text("|", style: TextStyle(fontSize: 40,color: Colors.black12)),

                                // Date
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    width: 190,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text("Date"),
                                      subtitle: Text(
                                        "SAT 2,AUG",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.arrow_drop_down,)),
                                    ),
                                  ),
                                ),
                                Text("|", style: TextStyle(fontSize: 40,color: Colors.black12)),

                                // Time
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    width: 190,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text("Time"),
                                      subtitle: Text(
                                        "10:00 PM",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.arrow_drop_down,)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Message Container
                        Container(
                          width: 590,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.do_not_disturb_alt_sharp),
                              SizedBox(width: 15),
                              Text(
                                "At the moment there is no availability for today. The next availability\n for 3 guests is tomorrow",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/image/picture.jpg",
                            width: 600,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 12),
                        Card(
                                                
                          child: Container(
                            height: 50,
                            width: 600,
                            child: ListView(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                    style: TextButton.styleFrom(backgroundColor: Colors.amber,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                    onPressed: (){},
                                      child: Center(child: Text("Asian"),
                                                
                                  )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Western"),
                                                
                                      )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Local"),
                                                
                                      )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Non-Halal"),
                                                
                                      )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Vegeterian"),
                                                
                                      )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Thailand"),
                                                
                                      )),
                                ),
                                SizedBox(width:
                                  12,),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPicture()));
                                      },
                                      child: Center(child: Text("Chinese"),
                                                
                                      )),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  height: 30,
                                  width: 130,
                                  // color: Colors.black12,
                                  child: TextButton(
                                      style: TextButton.styleFrom(backgroundColor: Colors.black12,overlayColor: Colors.amber,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12))),
                                      onPressed: (){},
                                      child: Center(child: Text("Beverian"),
                                                
                                      )),
                                ),
                                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(fixedSize: Size(200, 300)),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => ShowPicture(),));
                              }, child:
                            Container(
                              height: 300,
                              width: 200,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/image/picture.jpg",
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text("Laksa Johor",style:
                                    TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black),),
                                  ListTile(
                                    title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                                 trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 60),
                            // Text("Muhammad Safwan")
                            Column(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(fixedSize: Size(200, 300)),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPicture()));
                                  }, child:
                                Container(
                                  height: 300,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          "assets/image/picture.jpg",
                                          width: 200,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text("Laksa Johor",style:
                                      TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black),),
                                      ListTile(
                                        title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                                        trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                                      ),
                                    ],
                                  ),
                                ),),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/image/picture.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 60,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/image/picture.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ],
                            ),
                            Positioned(
                              top: 60,
                              child: Center(
                                child:  Padding(
                                  padding: const EdgeInsets.only(left: 255),
                                  child: Container(width: 500,height: 40,
                                    color: Colors.yellow,
                                    child: Center(child: Text("Proceeds to Booking\t \t                                                            RM 49.20",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),

                                    ),
                                ),
                                ),
                              ),



                          ],
                        )
                      ],
                    ),
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
