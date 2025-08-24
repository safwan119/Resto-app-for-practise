import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TimeDateCard extends StatefulWidget {
  const TimeDateCard({super.key});

  @override
  State<TimeDateCard> createState() => _TimeDateCardState();
}

class _TimeDateCardState extends State<TimeDateCard> {
  String guestcount1 = "1";
  var guestno1 = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedtime;
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
                              selectedDate == null ? 'SAT,4 AUG' : DateFormat('EEE,d MMM').format(selectedDate!),style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async{
                   DateTime? datePicker=await showDatePicker(context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2025),
                       lastDate: DateTime(2026),
                   );
                   if(datePicker!=null){
                     setState(() {
                       selectedDate=datePicker;
                     });
                   }
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
                        Text("Time", style: TextStyle(fontSize: 12)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            selectedtime == null ? '12:00 PM' : DateFormat('hh:mm a').format(DateTime(0,0,0, selectedtime!.hour, selectedtime!.minute)),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async{
                        TimeOfDay? timePicker=await showTimePicker(context: context, initialTime: TimeOfDay.now()
                        );
                        if(timePicker!=null){
                          setState(() {
                            selectedtime=timePicker;
                          });

                        }
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
          ],
        ),
      ),
    ) ;
  }
}
