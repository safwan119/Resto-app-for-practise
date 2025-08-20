import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer2 extends StatefulWidget{
  @override
  State<Drawer2> createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  var itemIndex=0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          children: [
            Text(
              "RESTO.COM",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 150,
              height: 25,
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
                    // backgroundColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.yellow,

        child: ListView(
          children: [
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,

                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, size: 20, grade: 12),
                ),
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              title: Text(
                "Full Name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Jhon Doe bin Lorem Ipsum"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
            // SizedBox(height: 60),
            ListTile(
              title: Text(
                "Email Address",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("example@resto.com"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
            // SizedBox(height: 60),
            ListTile(
              title: Text(
                "Phone Number",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("(60)11-6225-2454"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
            // SizedBox(height: 60),
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("2,Jalan Perjiranan 2,Bandar Dato Onn"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
            ListTile(
              title: Text(
                "RESTO.COM Bussiness",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Help Centre",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Privacy&Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "LogOut",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.logout),
              onTap: () {},
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),
                  // Icon(Icons.delete_rounded, color: Colors.red, size: 30),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}