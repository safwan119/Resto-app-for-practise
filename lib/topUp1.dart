import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';

class TopUp1 extends StatefulWidget {
  @override
  State<TopUp1> createState() => _Payment1State();
}

class _Payment1State extends State<TopUp1> {
  var itemIndex = 0;
  final firebaseReference = FirebaseDatabase.instance.ref("Wallet Balance");
  String _currentPrice = "0.00";
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
    } else {
      print("No User login ");
    }
    firebaseReference
        .child(id!)
        .orderByChild('id')
        .limitToLast(1)
        .onValue
        .listen((event) {
          final allData = event.snapshot.value as Map?;
          if (allData != null && allData.isNotEmpty) {
            final latestTransactionParent = allData.values.first;
            final price = latestTransactionParent["price"];
            if (price != null) {
              updatePrice(price);
              // setState(() {
              //   _currentPrice = price.toString();
              // });
            } else {
              updatePrice("0.00");
            }
          }
        });
  }

  void updatePrice(String newPrice) {
    if (_currentPrice != newPrice) {
      setState(() {
        _currentPrice = newPrice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
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
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Center(
              child: Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Top-up successful!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            Text(
              DateFormat('dd MMMM yyyy, hh:mm a').format(DateTime.now()),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PAYMENT",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Total amount of top-up",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "RM ${_currentPrice}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(value: 0),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PAYMENT METHOD",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "FPX PAYMENT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                title: "BACK HOME",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
