import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/service/payment_method_services.dart';
import 'package:my_first_proj/topUp1.dart';
import 'package:my_first_proj/topUp2.dart';
import 'package:my_first_proj/util/utills.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';
import 'drawer/drawer.dart';

class TopUp extends StatefulWidget {
  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  final priceController = TextEditingController();
  final firebaseReference = FirebaseDatabase.instance.ref("Wallet Balance");
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
    } else {
      print("No user login");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                          SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                              left: 0,
                              top: 6,
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
                                    fontSize: 30,
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
                      SizedBox(height: 10),
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
                      child: RoundedButton(
                        title: "PAY NOW",
                        ontap: () async {
                          double? price1 = double.tryParse(
                            priceController.text,
                          );
                          if (price1 != null) {
                            bool paymentSuccessful = await PaymentMethodServices.instance.makePayment(price1);
                            if (paymentSuccessful) {
                              final id1 = DateTime.now().millisecondsSinceEpoch.toString();
                              final localTimestamp = DateTime.now().millisecondsSinceEpoch;

                              final DatabaseReference userRef = firebaseReference.child(id!);
                              await userRef.child(id1).set({
                                "id": id1,
                                "price": priceController.text,
                                "timestamp": localTimestamp,
                                "serverTimestamp": ServerValue.timestamp,
                              }).then((value) async {
                                DataSnapshot snapshot = await userRef.child("currentPrice").get();
                                double existingPrice = 0.0;
                                if (snapshot.exists && snapshot.value != null) {
                                  existingPrice = double.tryParse(snapshot.value.toString()) ?? 0.0;
                                }
                                double newCurrentPrice = existingPrice + price1;
                                await userRef.child("currentPrice").set(newCurrentPrice);

                                Utils().toastMessage("Payment saved successfully");
                                priceController.clear();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopUp1(),
                                  ),
                                );
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                              });

                            } else {
                              Utils().toastMessage(
                                "Payment cancelled or failed.",
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TopUp2(),
                                ),
                              );
                            }
                          } else {
                            Utils().toastMessage(
                              "Please enter any amount or enter valid amount.",
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
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
