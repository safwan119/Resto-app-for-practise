import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/submRev.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';
import 'package:my_first_proj/util/utills.dart';

class RateRestaurant extends StatefulWidget {
  const RateRestaurant({super.key});

  @override
  State<RateRestaurant> createState() => _RateRestaurantState();
}

class _RateRestaurantState extends State<RateRestaurant> {
  final databaseReference = FirebaseDatabase.instance.ref(
    "UserDetail During Booking",
  );
  final databaseRef = FirebaseDatabase.instance.ref("AddToCard Menu");
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
    } else {
      if (kDebugMode) {
        print("No user login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
            Column(
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
                  width: 160,
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
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        "M",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontFamily: "M font",
                        ),
                      ),
                    ),
                    title: Text(
                      "MC Donald's Austin DT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      "Dine in Reservation,${DateFormat("hha,MMM dd").format(DateTime.now())}",
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubmitReview(),
                          ),
                        );
                      },
                      child: Text(
                        "Rate Restaurant",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TimeDateCard(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
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
                // final first = allData!.values.first;
                List list = allData!.values.toList();
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
                                        child: Text(
                                          "${list[index]["quantity"] ?? " "}x",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 21,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 2),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your added note",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1),
            StreamBuilder(
              stream: databaseReference.child(id!).onValue,
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
                // final first = allData!.values.first;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(allData?["note"]??""),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 17),
                Text("SUBTOTAL", style: TextStyle()),
                Spacer(),
                StreamBuilder(
                  stream: databaseReference.child(id!).onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.children.isEmpty) {
                      return Text("No data available");
                    }
                    if (snapshot.hasError) {
                      return Text("some error contain");
                    }
                    final allData = snapshot.data!.snapshot.value as Map?;
                    // final first = allData!.values.first;
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "RM ${allData?["price"]??""}",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    );
                  },
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
            Row(
              children: [
                SizedBox(width: 17),
                Text("PROMO CODE", style: TextStyle()),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "- RM 0.00",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(color: Colors.black12, value: 0),
            ),
            SizedBox(height: 20),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, size: 30),
                          SizedBox(width: 20),
                          Text(
                            "Need Help? Contact Resto Support",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
