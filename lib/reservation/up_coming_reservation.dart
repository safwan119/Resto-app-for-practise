import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpcomingReservation extends StatefulWidget {
  const UpcomingReservation({super.key});

  @override
  State<UpcomingReservation> createState() => _UpComingReservationState();
}

class _UpComingReservationState extends State<UpcomingReservation> {
  final firebaseDatabase = FirebaseDatabase.instance.ref("Reservation Setting");
  final database = FirebaseDatabase.instance.ref("UserDetail");
  final index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Reservation",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.black12,
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
            final data = Map<dynamic, dynamic>.from(
              snapshot.data!.snapshot.value as Map,
            );
            final first = data.values.first;
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
                              list[index]["Full name"] ?? "",
                              list[index]["Email address"] ?? "",
                              list[index]["Phone number"] ?? "",
                              list[index]["Address"] ?? "",
                              first["guestCount"]??" ",
                              first["date"]??" ",
                              first["time"]??'',
                              first["TableIds"]??" ",
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
        ),
      ),
    );
  }

  Future<void> _showDialogBox(
    String name,
    String emailAddress,
    String phoneNumber,
    String address,
      String totalGuests,
      String date,
      String time,
      String tableIds,
  ) async {
    return showDialog(
      context: context,
      builder: (index) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            "User Details",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name:",
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
                "Email Address:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(emailAddress),
              Text(
                "Address:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(address),
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
                "Total Guests:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(totalGuests),
              Text(
                "Table Id's:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(tableIds),
            ],
          ),
        );
      },
    );
  }
}
