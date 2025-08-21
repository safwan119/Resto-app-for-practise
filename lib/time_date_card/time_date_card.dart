import 'package:flutter/material.dart';
class TimeDateCard extends StatefulWidget {
  const TimeDateCard({super.key});

  @override
  State<TimeDateCard> createState() => _TimeDateCardState();
}

class _TimeDateCardState extends State<TimeDateCard> {
  String guestcount1 = "1";
  var guestno1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Guests",
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "$guestcount1 Guests",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter number of guest"),
                              content: TextField(
                                controller: guestno1,
                                decoration: InputDecoration(
                                  hintText: "Enter number",
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      guestcount1 = guestno1.text
                                          .toString();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("ok"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Text("|"),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Date", style: TextStyle(fontSize: 12)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "SAT,2 AUG",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("|"),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Time", style: TextStyle(fontSize: 12)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "12:00 PM",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}
