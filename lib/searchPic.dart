import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPicture extends StatefulWidget{
  @override
  State<SearchPicture> createState() => _SearchPictureState();
}

class _SearchPictureState extends State<SearchPicture> {
  var Search=TextEditingController();
  var itemIndex=0;
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
            // SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                child: TextField(
                  controller: Search,

                  decoration: InputDecoration(
                    hintText: "Search menu items",
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Default color
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white38,
      endDrawer: Drawer(
        backgroundColor: Colors.yellow,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(),
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
            SizedBox(height: 35),
            ListTile(
              title: Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 13,),
                Container(
                  width: 400,
                  height: 180,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Image.asset("assets/image/picture.jpg",

                    fit: BoxFit.cover,
                    ),

                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  width: 500,
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Asian",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                          onTap: (){},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Western",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),

                          ),
                          onTap: (){},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Local",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                          onTap: (){},
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Non-halal",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                          onTap: (){},
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Vegeterian",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                          onTap: (){},
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.black12,

                            ),
                            child: Center(child: Text("Thailand",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                          onTap: (){},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),

                              color: Colors.amber,

                            ),
                            child: Center(child: Text("Chinese",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),

                          ),
                          onTap: (){},
                        ),
                      )
                    ],
                  ),
                ),
               SizedBox(height: 12,),
                   Padding(
                     padding: const EdgeInsets.only(right: 150),
                     child: Card(
                      child: Container(
                        width: 230,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 4,),
                            Container(
                              width: 220,
                              height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/image/picture.jpg",
                                  width: 175,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),

                            ),
                            SizedBox(height: 13,),

                            Align(alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("Laksa Johor",style:
                                TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black)),
                            ),

                            ListTile(
                              title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                              trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                            ),

                          ],
                        ),


                      ),
                                       ),
                   ),

                SizedBox(height: 200,),
                 Card(elevation: 4,
                   child: InkWell(
                     child: Container(
                       width: 400,
                       height: 40,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(13),
                         color: Colors.amber,
                       ),
                       child:Row(
                         children: [
                           SizedBox(width: 30,),
                           Text("Proceeds to Booking",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                           SizedBox(width: 120,),
                           Text("RM 49.20",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                         ],
                       )
                     ),
                     onTap: (){},
                   ),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}