import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/deletAcc.dart';
class Drawer2 extends StatefulWidget{
  @override
  State<Drawer2> createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  List<Map<String,dynamic>> FoodDetailList2=[
    {
      "title":"Laksa johor"
    },
    {
      "title":"Laksa Penang"
    },
    {
      "title":"Laksa Lorem"
    },
    {
      "title":"Laksa Ipsum"
    },
  ];
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
            SizedBox(height: 10),
            ListTile(
              title: Text(
                "Full Name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Jon Doe bin Lorem Ipsum"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
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
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("2,Jalan Perjiranan 2,Bandar Data Onn"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {

              },
            ),
            ListTile(
              title: Text(
                "RESTO.COM Business",
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
                "Delete account",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DeleteAccount();
                }));
              },
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
            SizedBox(height: 50,)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBar1(),
      body:SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: FoodDetailList2.length,
              itemBuilder: (context,index){
                String title=FoodDetailList2[index]["title"];
                return FoodDetail2(title);
              }),
        ),
      ),
    );

  }
}
class FoodDetail2 extends StatelessWidget {
  String? title;
  FoodDetail2(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 6,),
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

              ),
            ),
            SizedBox(width: 6,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text(title!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                Text("Original flavour,spicy spices"),
                Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 8,),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),),
            )
          ],
        ),
      ),
    );
  }
}