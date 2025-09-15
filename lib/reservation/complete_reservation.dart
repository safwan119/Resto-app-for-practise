import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../util/utills.dart';

class CompleteReservation extends StatefulWidget {
  const CompleteReservation({super.key});

  @override
  State<CompleteReservation> createState() => _CompleteReservationState();
}

class _CompleteReservationState extends State<CompleteReservation> {
  final firebaseDatabase = FirebaseDatabase.instance.ref("Reservation Setting");
  final database = FirebaseDatabase.instance.ref("UserDetail");
  final databaseReference = FirebaseDatabase.instance.ref("AddToCard Menu");
  final databaseRef = FirebaseDatabase.instance.ref(
    "UserDetail During Booking",
  );
  final realtimeDatabase=FirebaseDatabase.instance.ref("Reservation mode");
  bool isSwitch=false;
  final index = 0;
  User? user=FirebaseAuth.instance.currentUser;
  String? id;
  @override
  void initState() {
    super.initState();
    dataEntry();
    if(user!=null){
      id=user!.uid;
    }
    else{
      print("No user login now");
    }
  }
  Future<void> dataEntry() async {
    final vacationModeSnapshot = await realtimeDatabase.once();
    final vacationData = vacationModeSnapshot.snapshot.value as Map?;
    print("Vacation data:${vacationData?["Reservation"]}");
    if (vacationData != null && vacationData.isNotEmpty) {
      setState(() {
        isSwitch = vacationData["Reservation"] ?? false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Complete Reservation"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder(
          stream: firebaseDatabase.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 5,
                ),
              );
            }
            if (!snapshot.hasData ||
                snapshot.data!.snapshot.children.isEmpty) {
              return Center(child: Text("No data available"));
            }            final data = Map<dynamic, dynamic>.from(
              snapshot.data!.snapshot.value as Map,
            );
            final first = data.values.first;
            return StreamBuilder(
              stream: databaseRef.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 5,
                    ),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.children.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                final data1 = Map<dynamic, dynamic>.from(
                  snapshot.data!.snapshot.value as Map,
                );
                final first1 = data1.values.first;
                return StreamBuilder(
                  stream: database.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                      );
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.children.isEmpty) {
                      return Center(child: Text("No data available"));
                    }
                    final allData = snapshot.data!.snapshot.value as Map?;
                    List list = allData!.values.toList();
                    return ListView.separated(
                      itemBuilder: ((context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${index + 1}.${list[index]["Full name"]}"),
                              Text("${first["date"]},${first["time"]}"),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black12,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                onPressed: () => _showDialogBox(
                                  first1["userName"],
                                  first1["userContact"],
                                  first["guestCount"],
                                  first["date"],
                                  first["time"],
                                  first1["note"],
                                ),
                                child: Text(
                                  "View Details",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      separatorBuilder: ((context, index) {
                        return Divider();
                      }),
                      itemCount: list.length,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _showDialogBox(
    String name,
    String phoneNumber,
    String totalPax,
    String date,
    String time,
    String notes,
  ) async {
    return showDialog(
      context: context,
      builder: (index) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            "${name}'s order details",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(name),
              Text(
                "Phone Number:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(phoneNumber),
              Text(
                "Date&Time:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$date , $time"),
              Text(
                "Total Pax:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(totalPax),
              Text(
                "Order Note",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(notes),
              SizedBox(height: 30),
              Text(
                "Order Summary",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StreamBuilder(
                stream: databaseReference.onValue,
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
                  List<dynamic> productList = [];
                  if (allData != null) {
                    allData.values.forEach((element) {
                      if (element is Map) {
                        productList.addAll(element.values);
                      }
                    });
                  }
                  print("List in this :$productList");
                  return SizedBox(
                    width: double
                        .maxFinite,
                    height: 170,
                    child: ListView.separated(itemCount: productList.length,

                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          print("List in this :${productList[index]["title"]}");
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("${index+1}.${productList[index]["title"] ?? " "}"),
                                 Text("x${productList[index]["quantity"]}"),
                                 Text("${productList[index]["options1"]},${productList[index]["options2"]}")
                               ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                      },),
                  );
                },
              ),
              Text(
                "Reservation Completed?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Clicking the button will move the order to COMPLETED RESERVATION tab,this will mark as order is completed."),
              Row(
                children: [
                  Switch(
                    focusColor: Colors.amber,
                    activeThumbColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    hoverColor: Colors.black12,
                    value: isSwitch,
                    onChanged: (value) async {
                      if (value) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Reservation Completed?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content:  Text("Clicking the button will move the order to COMPLETED RESERVATION tab,this will mark as order is completed."),
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.black12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      isSwitch = value;
                                      print("The switched value is:$isSwitch");
                                    });
                                    databaseReference.child(id!).remove().then((value){
                                      Utils().toastMessage("Remove Successfully");
                                    });
                                    firebaseDatabase.child(id!).remove().then((value){
                                      Utils().toastMessage("Remove Successfully");
                                    });
                                    final vacationSnapshot = await realtimeDatabase
                                        .once();
                                    final data =
                                    vacationSnapshot.snapshot.value as Map?;
                                    if (data != null && data.isNotEmpty) {
                                      await realtimeDatabase
                                          .update({"Reservation": isSwitch})
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
                                    } else {
                                      await realtimeDatabase
                                          .set({"Reservation": isSwitch})
                                          .then((value) {
                                        Utils().toastMessage(
                                          "Set Successfully",
                                        );
                                      })
                                          .onError((error, stackTrace) {
                                        Utils().toastMessage(
                                          error.toString(),
                                        );
                                      });
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: Text("Completed"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        setState(() {
                          isSwitch = value;
                        });
                        final vacationSnapshot = await realtimeDatabase.once();
                        final data = vacationSnapshot.snapshot.value as Map?;
                        if (data != null && data.isNotEmpty) {
                          await realtimeDatabase
                              .update({"Reservation": isSwitch})
                              .then((value) {
                            Utils().toastMessage("Update Successfully");
                          })
                              .onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                          });
                        } else {
                          await database
                              .set({"Reservation": isSwitch})
                              .then((value) {
                            Utils().toastMessage("Set Successfully");
                          })
                              .onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                          });
                        }
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
