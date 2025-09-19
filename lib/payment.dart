import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/rate_restaurant.dart';
import 'package:my_first_proj/revOrder.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/wallet_balance.dart';

class Payment1 extends StatefulWidget {
  const Payment1({super.key});

  @override
  State<Payment1> createState() => _Payment1State();
}

class _Payment1State extends State<Payment1> {
  final firebaseRef = FirebaseDatabase.instance.ref("Reservation Setting");
  final databaseReference = FirebaseDatabase.instance.ref(
    "UserDetail During Booking",
  );
  var itemIndex = 0;
  String? id;
  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    if(user!=null){
      id=user!.uid;
    }
    else{
      debugPrint("No User login now");
    }
  }

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
                size: 90,
                color: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Reservation placed successful!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            Text(
              DateFormat("dd MMMM yyyy, mm:hh a").format(DateTime.now()),
              style: TextStyle(fontSize: 17),
            ),

            SizedBox(height: 40),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PAYMENT",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Spacer(),
                StreamBuilder(
                  stream: databaseReference.child(id!).onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.children.isEmpty) {
                      return Text("No data available");
                    }
                    final data = snapshot.data!.snapshot.value as Map?;
                    final price=data?["price"]??'0.00';
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "RM${price}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Amount deducted from app wallet",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PAYMENT METHOD",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletBalance()),
                    );
                  },
                  child: Text(
                    "In APP WALLET",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 200),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundedButton(
                  title: "VIEW ORDER DETAILS",
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RateRestaurant())
                    );
                  },
                ),
              ),

          ],
        ),
      ),
    );
  }
}
