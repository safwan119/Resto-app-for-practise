import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopUp extends StatefulWidget {
  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  var itemIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Text(
              "RESTO.COM",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 170,
              height: 30,
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
                    fontSize: 16,
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
            SizedBox(height: 60),
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
              SizedBox(height: 30),
              Row(
                children: [
                  // SizedBox(width: 50),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_outlined, size: 30,color: Colors.black,),
                  ),
                  Text(
                    "Top Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(

                child: Container(
                  width: 400,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      end: Alignment.centerRight,

                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.amberAccent,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "Top up amount",
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          SizedBox(width: 100),
                          Text(
                            "RM",
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "90.00",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "The amount will be credited by you account immediately and can be used for future transaction",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 8,

                child: Container(
                  width: double.infinity,
                  height: 700,
                  color: Colors.white,
                  child: Column(
                    children: [
                      // SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text("Payment Method",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(),
                        child: ListTile(
                          leading: Icon(
                            Icons.card_membership_sharp,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          title: Text(
                            "FPX PAYMENT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            "Redirect to your bank and make a payment", style: TextStyle(
                            // color: Colors.black,

                            fontSize: 12,
                          ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.deepOrangeAccent,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 343,
                        child: LinearProgressIndicator(
                          // color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.card_membership_sharp,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          title: Text(
                            "CREDIT/DEBIT CARD PAYMENT",
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            "Enter your card detail and make a payment",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      SizedBox(height: 110),
                      Card(
                        elevation: 3,
                        child: InkWell(
                          child: Container(
                            width: 400,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(
                                "PAY NOW",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12), // left padding before icon
                          Icon(
                            Icons.not_interested_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(width: 12), // space between icon and text
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(text: "By Continuing, you have read and agree to Resto.com "),
                                  TextSpan(
                                    text: "terms and condition",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12), // right padding
                        ],
                      ),
                    ),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],)
    ),)
    );
  }
}
