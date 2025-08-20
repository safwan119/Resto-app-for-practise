// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPicture extends StatefulWidget {
  const FoodPicture({super.key});

  @override
  State<FoodPicture> createState() => _FoodPictureState();
}

class _FoodPictureState extends State<FoodPicture> {
  var itemIndex = 0;
  var Search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:12,),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Hello,Aiman",style: TextStyle(color: Colors.black,fontSize: 16),),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Let's Make a Flash Order",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ))
            ,
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9),
                          bottomRight: Radius.circular(9),
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9),)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Default color
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Color when focused
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
        backgroundColor: Colors.amber,
      ),
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                child:Container(
                  width:double.infinity,
                  height: 125,
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 106,
                          width: 135,
                          child:ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/image.png",width:250,height:300,fit: BoxFit.cover,)),

                        ),
                      ),
                       SizedBox(width: 10,),
                       Column(
                         children: [
                           SizedBox(height: 20,),
                            Text(
                                           "Legend Licious Cafe house",
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 17
                                           ),
                                         ),

                                     Text("210Km away - pick up in 15min "),
                           SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.only(right: 120),
                             child: Row(
                               // mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 Icon(Icons.star,color: Colors.amber,),
                                 SizedBox(width: 12,),
                                 Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                 Text(". Halal")
                               ],
                             ),
                           )

                         ],
                       )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                child:Container(
                  width:double.infinity,
                  height: 125,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 106,
                          width: 135,
                          child:ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset("assets/image/image.png",width:250,height:300,fit: BoxFit.cover,)),

                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          Text(
                            "Legend Licious Cafe house",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),
                          ),

                          Text("210Km away - pick up in 15min "),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(Icons.star,color: Colors.amber,),
                                SizedBox(width: 12,),
                                Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                Text(". Halal")
                              ],
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 200,),
          ],
        ),
      ),
    );
  }
}
