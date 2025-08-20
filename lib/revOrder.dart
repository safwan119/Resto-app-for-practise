// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewOrder extends StatefulWidget {
  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  var notes = TextEditingController();
  String guestcount1 = "1";
  var guestno1 = TextEditingController();
  var name = TextEditingController();
  var number = TextEditingController();
  var itemIndex = 0;
  var code=TextEditingController();
  Widget build(BuildContext contex) {
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
              height: 26,
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
              Row(
                children: [
                   Padding(
                      padding: const EdgeInsets.only(),
                      child: IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                      ),
                    ),

                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      "Review order details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 266),
                child: Text(
                  " Contact details",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    enabledBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+92 | 3401234456",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    enabledBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 380,
                child: LinearProgressIndicator(color: Colors.black12, value: 0),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 158),
                child: Text(
                  "Reservation Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                // elevation: 4,
                child: Container(
                  width: double.infinity,
                  height: 59,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 4,),
                      Column(

                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("GUESTS",style: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("${guestcount1} GUESTS")
                        ],
                      ),
                      IconButton(onPressed: (){
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

                          icon: Icon(Icons.arrow_drop_down)),
                      SizedBox(width: 5,),
                      Text("|",style: TextStyle(fontSize: 27),),
                      SizedBox(width: 10,),
                      Column(

                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 26),
                            child: Text("Date",style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("SAT,2 AUG")
                        ],
                      ),
                      // SizedBox(width: 2,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
                      SizedBox(width: 4,),
                      Text("|",style: TextStyle(fontSize: 27),),
                      SizedBox(width: 8,),
                      Column(

                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text("Time",style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("12:00 PM")
                        ],
                      ),
                      // SizedBox(width: 4,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 385,
                child: LinearProgressIndicator(color: Colors.black12, value: 0),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 215),
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),

                    Row(
                      children: [
                        Card(
                          child: Container(
                            width: 339,
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
                                      padding: const EdgeInsets.only(right: 80),
                                      child: Text("Laksa johor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                    ),
                                    Text("Original flavour,spicy spices"),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 100),
                                      child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 18,),
                                Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                              ],
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.red,size: 32,)),

                      ],
                    ),
              SizedBox(height: 8),

              Row(
                children: [
                  Card(
                    child: Container(
                      width: 339,
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
                                padding: const EdgeInsets.only(right: 80),
                                child: Text("Laksa Penang",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text("Original flavour,spicy spices"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 110),
                                child: Text("RM 27.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              ),

                            ],
                          ),
                          SizedBox(width: 2,),
                          Text("1x",style: TextStyle(color: Colors.amber,fontSize: 19),)



                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.red,size: 32,)),

                ],
              ),SizedBox(height: 8),

              Row(
                children: [
                  Card(
                    child: Container(
                      width: 339,
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
                                child: Text("Laksa Lorem",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
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
                          SizedBox(width: 4,),
                          Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.red,size: 32,)),

                ],
              ),SizedBox(height: 8),

              Row(
                children: [
                  Card(
                    child: Container(
                      width: 339,
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
                          SizedBox(width: 6,),
                          Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.red,size: 32,)),

                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 380,
                child: LinearProgressIndicator(color: Colors.black12, value: 0),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 115),
                child: Text(
                  "Add your notes(Optional)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: notes,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "The cake I ordered is for surprised party!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    enabledBorder: OutlineInputBorder(
                      // color:Colors.blue,
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19,),
              Container(
                width: 375,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,

                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 270,
                      child: TextField(
                        controller: code,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.code_off),
                          hintText: " |   ENTER PROMO CODE HERE",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // color:Colors.blue,
                            borderSide: BorderSide(color: Colors.blue)
                          ),
                          enabledBorder: OutlineInputBorder(
                            // color:Colors.blue,
                              borderSide: BorderSide(color: Colors.black)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6,),
                  InkWell(
                    child: Container(
                      height: 55,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber,

                      ),
                      child: Center(child: Text("Use",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),

                    ),
                    onTap: (){},
                  )
                ],
              ),
              SizedBox(height: 15,),
              InkWell(
                child: Container(
                  width: 390,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                      color:Colors.amber
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.monetization_on_sharp),
                      SizedBox(width: 20,),
                      Text("|"),
                      SizedBox(width:30),
                      Text("REDEEM RM 5 WITH YOUR COINS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                onTap: (){},
              ),
              SizedBox(height: 20,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,

                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 4,),
                  Text("SUBTOTAL",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                   SizedBox(width: 220,),
                   Text("RM 78.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                ],
              ),
              // SizedBox(height: 6,),
              Row(
                children: [
                  SizedBox(width: 4,),
                  Text("SERVICE CHARGE",style: TextStyle(),),
                  SizedBox(width: 185,),
                  Text("RM 7.02",style: TextStyle(color: Colors.black,fontSize: 15),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,

                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:Colors.amber,

                    ),
                     child: Row(
                       children: [
                         SizedBox(width: 20,),
                         Text("Place Order Now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        SizedBox(width: 150,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("RM 78.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                         ),
                       ],
                     ),
                  ),
                ),
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}
