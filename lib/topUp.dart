import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';
import 'drawer/drawer.dart';
class TopUp extends StatefulWidget {
  @override
  State<TopUp> createState() => _TopUpState();
}
class _TopUpState extends State<TopUp> {
  final priceController = TextEditingController();
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
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
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
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      end: Alignment.centerRight,

                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.amber.shade50,
                        Colors.amber.shade100,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            "Top up amount",
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          Spacer(),
                          Text(
                            "RM",
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 0,
                              left: 0,
                              top: 11,
                            ),
                            child: Container(
                              height: 40,
                              width: 100,
                              child: TextFormField(
                                controller: priceController,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  hintText: "90.00",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "The amount will be credited by you account immediately and can be used for future transaction",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Card(
              elevation: 8,

              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment Method",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                          "Redirect to your bank and make a payment",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Icon(
                          Icons.check,
                          color: Colors.deepOrangeAccent,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(value: 0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: LinearProgressIndicator(
                        color: Colors.black12,
                        value: 0,
                      ),
                    ),
                    SizedBox(height: 110),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                        elevation: 3,
                        child: InkWell(
                          child: Container(
                            width: double.infinity,
                            height: 50,
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
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12),
                            Icon(
                              Icons.not_interested_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "By Continuing, you have read and agree to Resto.com ",
                                    ),
                                    TextSpan(
                                      text: "terms and condition",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
