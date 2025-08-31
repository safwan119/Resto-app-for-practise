import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_proj/utill/utills.dart';

class TimeDateCard extends StatefulWidget {
  const TimeDateCard({super.key});

  @override
  State<TimeDateCard> createState() => _TimeDateCardState();
}

class _TimeDateCardState extends State<TimeDateCard> {
  String guestCount = "1";
  var guestController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final databaseRefer = FirebaseDatabase.instance.ref("Reservation Setting");
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
    } else {
      print("No user is login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            _buildGuestSection(),
            _verticalDivider(),
            _buildDateSection(),
            _verticalDivider(),
            _buildTimeSection(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? datePicker = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      initialDate: DateTime.now(),
    );
    if (datePicker != null) {
      setState(() {
        selectedDate = datePicker;
      });
      await _checkAvailability();
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timePicker != null) {
      setState(() {
        selectedTime = timePicker;
      });
      await _checkAvailability();
    }
  }

  Future<void> _saveReservation() async {
    if (selectedDate != null && selectedTime != null && id != null) {
      databaseRefer.child(id!).once().then((snapshot) async {
        final data = snapshot.snapshot.value as Map?;
        if (data != null && data.isNotEmpty) {
          await databaseRefer
              .child(id!)
              .update({
                'guestCount': guestCount,
                'date': DateFormat('EEE, d MMM').format(selectedDate!),
                'time': DateFormat('hh:mm a').format(
                  DateTime(0, 0, 0, selectedTime!.hour, selectedTime!.minute),
                ),
              })
              .then((value) {
                Utills().toastmessage("Reservation Update Successfully");
              })
              .onError((error, stackTrace) {
                Utills().toastmessage(error.toString());
              });
        } else {
          await databaseRefer
              .child(id!)
              .set({
                'guestCount': guestCount,
                'date': DateFormat('EEE, d MMM').format(selectedDate!),
                'time': DateFormat('hh:mm a').format(
                  DateTime(0, 0, 0, selectedTime!.hour, selectedTime!.minute),
                ),
              })
              .then((value) {
                Utills().toastmessage("Reservation set Successfully");
              })
              .onError((error, stackTrace) {
                Utills().toastmessage(error.toString());
              });
        }
      });
    }
  }

  Future<void> _checkAvailability() async {
    if (selectedDate != null && selectedTime != null) {
      final reservationSnapshot = await databaseRefer.child(id!).once();
      int totalTables = 5;
      int guestPerTable = 2;
      int bookSeats = 0;
      if (reservationSnapshot.snapshot.value != null) {
        bookSeats = reservationSnapshot.snapshot.children.length;
      }
      int totalCapacity = totalTables * guestPerTable;
      int availableSeats = totalCapacity - bookSeats;
      int totalGuest = int.parse(guestCount);
      if (totalGuest <= availableSeats) {
        int availableTables = 0;
        availableTables = (availableSeats / guestPerTable).floor();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$availableTables table is available at this selected date time",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber,
          ),
        );
        await _saveReservation();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Not enough seats available for $totalGuest guests.",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildGuestSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Guests", style: TextStyle(fontSize: 12)),
            Text(
              "$guestCount Guests",
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        IconButton(
          onPressed: () => _showDialogBox(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDateSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date", style: TextStyle(fontSize: 12)),
            Text(
              selectedDate == null
                  ? 'SAT,4 AUG'
                  : DateFormat('EEE,d MMM').format(selectedDate!),
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ],
        ),
        IconButton(
          onPressed: () => _selectDate(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(height: 30, child: VerticalDivider(color: Colors.black));
  }

  Widget _buildTimeSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Time", style: TextStyle(fontSize: 12)),
            Text(
              selectedTime == null
                  ? '12:00 PM'
                  : DateFormat('hh:mm a').format(
                      DateTime(
                        0,
                        0,
                        0,
                        selectedTime!.hour,
                        selectedTime!.minute,
                      ),
                    ),
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        IconButton(
          onPressed: () => _selectTime(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        ),
      ],
    );
  }

  Future<void> _showDialogBox() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter number of guests"),
          content: TextField(
            controller: guestController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter number"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  guestCount = guestController.text.isNotEmpty
                      ? guestController.text
                      : "1";
                });
                Navigator.pop(context);
                await _checkAvailability();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
