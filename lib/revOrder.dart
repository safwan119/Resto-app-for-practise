import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/payment.dart';
import 'package:my_first_proj/payment1.dart';
import 'package:my_first_proj/prome_code/promo_code_database.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';
import 'package:my_first_proj/util/utills.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';

class ReviewOrder extends StatefulWidget {
  const ReviewOrder({super.key});

  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  var remainingPrice = 0;
  final databaseReference = FirebaseDatabase.instance.ref(
    "UserDetail During Booking",
  );
  final databaseRef = FirebaseDatabase.instance.ref("AddToCard Menu");
  final firebaseDatabaseReference = FirebaseDatabase.instance.ref(
    "Promo Codes",
  );
  final firebaseReference = FirebaseDatabase.instance.ref("Wallet Balance");
  var notesController = TextEditingController();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var itemIndex = 0;
  var codeController = TextEditingController();
  String? id;
  User? user = FirebaseAuth.instance.currentUser;
  double totalPrice = 0.0;
  int itemCount = 1;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
      databaseReference
          .child(id!)
          .once()
          .then((snapshot) {
            final data = snapshot.snapshot.value as Map?;
            if (data != null) {
              nameController.text = data["userName"] ?? " ";
              phoneNumberController.text = data["userContact"] ?? " ";
              notesController.text = data["note"] ?? "";
            }
          })
          .onError((error, stackTrace) {
            Utils().toastMessage(error.toString());
          });
    } else {
      print("No user login");
    }
  }

  double calculatingPrice(String promoCode, String percentage) {
    if (codeController.text == promoCode) {
      String percentage1 = percentage.replaceAll("%", "");
      double percent = double.parse(percentage1);
      double discountAmount = (totalPrice) * (percent / 100);
      return totalPrice - discountAmount;
    } else {
      return totalPrice;
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
              height: 26,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PromoCodeDatabase()),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),

                SizedBox(width: 8),
                Text(
                  "Review order details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " Contact details",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "+92 | 3401234456",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reservation Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TimeDateCard(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: databaseRef.child(id!).onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.black,
                    ),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.children.isEmpty) {
                  return Text("No data available");
                }
                if (snapshot.hasError) {
                  return Text("some error contain");
                }
                final allData = snapshot.data!.snapshot.value as Map?;
                List list = allData!.values.toList();
                double newTotalPrice = 0.0;
                for (var item in list) {
                  if (item["price"] != null) {
                    double price =
                        double.tryParse(item["price"].toString()) ?? 0.0;
                    newTotalPrice += price;
                  }
                }
                if (newTotalPrice != totalPrice) {
                  totalPrice = newTotalPrice;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    SizedBox(width: 6),
                                    SizedBox(
                                      width: 100,
                                      height: 75,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: Image.network(
                                          list[index]["image"] ?? " ",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 8),
                                          Text(
                                            list[index]["title"] ?? " ",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            list[index]["description"] ?? " ",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          Text(
                                            "RM ${list[index]["price"] ?? " "}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 7),
                                      child: SizedBox(
                                        width: 30,
                                        child: InkWell(
                                          onTap: () {
                                            int currentQuantity =
                                                list[index]['quantity'];
                                            int addedQuantity =
                                                currentQuantity + 1;
                                            var retrievedPrice =
                                                list[index]["price"];
                                            double currentTotalPrice;

                                            if (retrievedPrice is String) {
                                              currentTotalPrice = double.parse(
                                                retrievedPrice,
                                              );
                                            } else if (retrievedPrice
                                                is double) {
                                              currentTotalPrice =
                                                  retrievedPrice;
                                            } else {
                                              currentTotalPrice = 0.0;
                                            }
                                            double basePrice =
                                                (currentQuantity > 0)
                                                ? (currentTotalPrice /
                                                      currentQuantity)
                                                : currentTotalPrice;
                                            double newTotalPrice =
                                                basePrice * addedQuantity;
                                            databaseRef
                                                .child(id!)
                                                .child(list[index]["id"])
                                                .update({
                                                  "quantity": addedQuantity,
                                                  "price": newTotalPrice
                                                      .toString(),
                                                })
                                                .then((value) {
                                                  Utils().toastMessage(
                                                    "Update Successfully",
                                                  );
                                                })
                                                .onError((error, stackTrace) {
                                                  Utils().toastMessage(
                                                    error.toString(),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "${list[index]["quantity"]}x",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 21,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final itemId = list[index]?["id"];
                              print("All data id's:${list[index]["id"]}");
                              if (itemId == null) {
                                Utils().toastMessage(
                                  "Error while deleting the menu..",
                                );
                                return;
                              }
                              await databaseRef
                                  .child(id!)
                                  .child(itemId)
                                  .remove()
                                  .then((value) {
                                    Utils().toastMessage("Delete Successfully");
                                  })
                                  .onError((error, stackTrace) {
                                    Utils().toastMessage(error.toString());
                                  });
                            },
                            icon: Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add your notes(Optional)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: notesController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "The cake I ordered is for surprised party!",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 15),
            StreamBuilder(
              stream: firebaseDatabaseReference.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final promoData = Map<dynamic, dynamic>.from(
                  snapshot.data!.snapshot.value as Map,
                );
                final first = promoData.values.first;
                print("Promo data in this:${first["promo"]}");
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: codeController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.code_off),
                            hintText: " |   ENTER PROMO CODE HERE",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        child: Container(
                          height: 55,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,
                          ),
                          child: Center(
                            child: Text(
                              "Use",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (codeController.text == first["promo"]) {
                            String percentage1 = first["percentage"].replaceAll(
                              "%",
                              "",
                            );
                            double percent = double.parse(percentage1);
                            double discountAmount =
                                (totalPrice) * (percent / 100);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                totalPrice = totalPrice - discountAmount;
                              });
                            });

                            print("The price is :$totalPrice");
                          } else if (codeController.text.isEmpty) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                totalPrice = totalPrice;
                              });
                            });
                          } else {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                totalPrice = totalPrice;
                              });
                            });

                            print("The price is :$totalPrice");
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 15),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.amber,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.monetization_on_sharp),
                      SizedBox(width: 20),
                      Text("|"),
                      SizedBox(width: 30),
                      Text(
                        "REDEEM RM 5 WITH YOUR COINS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 17),
                Text("SUBTOTAL", style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "RM ${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 17),
                Text("SERVICE CHARGE", style: TextStyle()),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "RM 0.00",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 20),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Place Order Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "RM ${totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final walletSnapshot = await firebaseReference.child(id!).once();
                final walletData = walletSnapshot.snapshot.value as Map?;

                if (walletData != null && walletData.isNotEmpty) {

                  if (walletData != null &&
                      walletData.containsKey("currentPrice")) {
                    double currentPrice = (walletData["currentPrice"] as num)
                        .toDouble();

                    double remainingPrice;

                    if (currentPrice >= totalPrice) {
                      remainingPrice = currentPrice - totalPrice;

                      Utils().toastMessage("Transaction successful!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment1()),
                      );
                    } else {
                      remainingPrice = currentPrice;
                      Utils().toastMessage("Transaction Unsuccessful!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment2()),
                      );
                    }

                    await firebaseReference.child(id!).update({
                      "currentPrice": remainingPrice,
                    });
                  } else {
                    Utils().toastMessage("Current balance not found.");
                  }
                }
                else {
                  Utils().toastMessage("No wallet data available.");
                }
                if (id != null) {
                  final userSnapshot = await databaseReference
                      .child(id!)
                      .once();
                  final allData = userSnapshot.snapshot.value as Map?;
                  if (allData != null && allData.isNotEmpty) {
                    await databaseReference
                        .child(id!)
                        .update({
                          "userName": nameController.text,
                          "userContact": phoneNumberController.text,
                          "note": notesController.text,
                          "price": totalPrice,
                        })
                        .then((value) {
                          Utils().toastMessage(
                            "User Detail Update Successfully",
                          );
                        })
                        .onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                  } else {
                    await databaseReference
                        .child(id!)
                        .set({
                          "userName": nameController.text,
                          "userContact": phoneNumberController.text,
                          "note": notesController.text,
                          "price": totalPrice,
                        })
                        .then((value) {
                          Utils().toastMessage("User Detail Set Successfully");
                        })
                        .onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
