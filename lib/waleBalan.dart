import 'package:flutter/material.dart';

class WalletBalance extends StatefulWidget {
  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
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
              SizedBox(height: 20),
              Row(
                children: [
                  // SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_outlined, size: 27),
                  ),
                  Text(
                    "Wallet Balance",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 4,
                child: Container(
                  width: 400,
                  height: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [ Container(
                          width: 400,
                          height: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                            ),
                              child: Image.asset("assets/image/Screenshot.jpg",
                          fit: BoxFit.cover,
                          )
                          ),
                          
                        ),
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(right:240),
                                child: Text("RESTO.COM",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:240),
                                child: Container(
                                  height: 17,
                                  width: 105,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white
                                  ),
                                  child: Center(child: Text("MAKE FLASH ORDER",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),)),
                                   
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(right: 260),
                                child: Text("RM 99.00",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Your current balance that is available to be used for payments",style: TextStyle(color: Colors.white),),
                              ),



                            ],
                          ),
                          Positioned(
                            top: 132,
                            left: 130,
                            child: Container(
                              width: 170,
                              height: 25,
                              color: Colors.black,
                            ),
                          )

                          
                        ]
                      ),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Icon(Icons.monetization_on_outlined,size: 30,color: Colors.yellow,),
                        title: Text("142 POINTS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                      ),
                      LinearProgressIndicator(
                        value: 0,

                      ),
                      ListTile(
                        leading: Icon(Icons.card_membership_sharp,size: 30,color: Colors.yellow,),
                        title: Text("TOP UP YOUR BALANCE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Card(
                elevation: 6,
                child: Container(
                  height: 900,
                  width: 400,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 116),
                        child: Text("Recent Transactions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to McDonalds Seri Austin DT"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("CASH IN TOP UP",),
                          subtitle: Text("Top up to app account"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("PAYMENT",),
                          subtitle: Text("Payment to Starbucks TD Central"),
                          trailing: Text("RM 82.30",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),


                        ),

                      ),
                      Container(
                        width: 350,
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: 0,
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
