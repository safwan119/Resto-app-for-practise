import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';

import 'drawer/drawer.dart';

class WalletBalance extends StatefulWidget {
  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  var itemIndex = 0;
  List<Map<String, dynamic>> walletList = [
    {"subtitle": "Payment to McDonald's Seri Austin DT", "title": "PAYMENT"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
    {"subtitle": "Top up to app account", "title": "CASH IN TOP UP"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
    {"subtitle": "Payment to Starbucks TD Central", "title": "PAYMENT"},
  ];

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
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_outlined, size: 27),
                    ),
                  ),
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,

                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/image/Screenshot.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    "RESTO.COM",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(alignment:Alignment.centerLeft,
                                  child: Container(
                                    height: 17,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "MAKE FLASH ORDER",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 50,
                            right: 0,
                            left: 20,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "RM 99.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Your current balance that is available to be used for payments",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(
                          Icons.monetization_on_outlined,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          "142 POINTS",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      LinearProgressIndicator(value: 0),
                      ListTile(
                        leading: Icon(
                          Icons.card_membership_sharp,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          "TOP UP YOUR BALANCE",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Card(
              elevation: 6,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recent Transaction",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: walletList.length,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: LinearProgressIndicator(value: 0),
                          );
                        },
                        itemBuilder: (context, index) {
                          String title = walletList[index]["title"];
                          String subtitle = walletList[index]["subtitle"];
                          return Wallet(subtitle, title);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  String subtitle;
  String title;

  Wallet(this.subtitle, this.title);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle, overflow: TextOverflow.ellipsis),
      trailing: Text(
        "RM 82.30",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}