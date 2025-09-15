import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/topUp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'drawer/drawer.dart';

class WalletBalance extends StatefulWidget {
  const WalletBalance({super.key});

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  final firebaseReference = FirebaseDatabase.instance.ref("Wallet Balance");
  var itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                          SizedBox(
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 17,
                                    width: 120,
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
                            bottom: 40,
                            right: 0,
                            left: 20,
                            child: Column(
                              children: [
                                StreamBuilder(
                                  stream: firebaseReference.onValue,
                                  builder:
                                      (
                                        context,
                                        AsyncSnapshot<DatabaseEvent> snapshot,
                                      ) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 4,
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                        if (!snapshot.hasData ||
                                            snapshot
                                                .data!
                                                .snapshot
                                                .children
                                                .isEmpty) {
                                          return Text("No data available");
                                        }
                                        if (snapshot.hasError) {
                                          return Text("some error contain");
                                        }
                                        final allData =
                                            snapshot.data!.snapshot.value
                                                as Map?;
                                        final first=allData!.values.first;
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "RM ${first["currentPrice"].toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        );
                                      },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TopUp()),
                            );
                          },
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
                    StreamBuilder(
                      stream: firebaseReference.onValue,
                      builder:
                          (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 4,
                                  color: Colors.black,
                                ),
                              );
                            }
                            if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                              return Text("No transactions found.");
                            }

                            if (snapshot.hasError) {
                              return Text("An error occurred: ${snapshot.error}");
                            }
                            final allData = snapshot.data!.snapshot.value as Map?;
                            if (allData == null || allData.isEmpty) {
                              return Text("No data available");
                            }
                             final userData = allData.values.first as Map?;

                            if (userData == null) {
                              return Text("No user data available");
                            }
                            List transactionList = [];
                            userData.forEach((key, value) {
                              if (value is Map) {
                                transactionList.add(value);
                              }
                            });
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: transactionList.length,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: LinearProgressIndicator(value: 0),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  print("the one transaction is :${transactionList[index]["price"]}");
                                  final transaction=transactionList[index];
                                  return ListTile(
                                    title: Text("PAYMENT"),
                                    subtitle: Text(
                                      "Top up to app account",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: Text(
                                      "RM${transaction["price"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
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
