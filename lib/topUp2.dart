
import 'package:flutter/material.dart';

class TopUp2 extends StatefulWidget{
  @override
  State<TopUp2> createState() => _Payment1State();
}

class _Payment1State extends State<TopUp2> {
  var itemIndex=0;
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(child: Icon(Icons.cancel,size: 80,color: Colors.redAccent,)),
              SizedBox(height: 10,),
              Text("Top-up successful!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 27),),
              Text("18 August 2024,12:39 PM",style: TextStyle(fontSize: 16),),
              SizedBox(height: 40,),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: Text("PAYMENT",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text("Total amount of top-up",style: TextStyle(fontSize: 14),),
                      ),
                    ],
                  ),
                  SizedBox(width: 140,),
                  Text("RM 90.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ],
              ),




              SizedBox(height: 20,),
              Container(
                width: 370,
                child: LinearProgressIndicator(

                  value: 0,
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("PAYMENT METHOD",style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 235),
                child: Text("FPX PAYMENT",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 200,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Card(
                    elevation: 4,
                    child: Container(
                      width: 400,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color:Colors.amber,

                      ),


                      child:  Center(child: Text("BACK HOME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),


                    ),
                  ),
                  onTap: (){},
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}