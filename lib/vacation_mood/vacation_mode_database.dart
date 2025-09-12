import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/util/utills.dart';

class VacationModeDatabase extends StatefulWidget {
  const VacationModeDatabase({super.key});

  @override
  State<VacationModeDatabase> createState() => _VacationModeDatabaseState();
}

class _VacationModeDatabaseState extends State<VacationModeDatabase> {
  final database = FirebaseDatabase.instance.ref("Vacation Mode");
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    dataEntry();
  }

  Future<void> dataEntry() async {
    final vacationModeSnapshot = await database.once();
    final vacationData = vacationModeSnapshot.snapshot.value as Map?;
    print("Vacation data:${vacationData?["vacation"]}");
    if (vacationData != null && vacationData.isNotEmpty) {
      setState(() {
        isSwitched = vacationData["vacation"] ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacation Mode Setting"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Vacation Mode",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "(Clicking the button will disable your availability in the app. When you return, you’ll need to manually toggle it back on.)",
            ),
            Row(
              children: [
                Text("ON"),
                Switch(
                  focusColor: Colors.amber,
                  activeThumbColor: Colors.blueAccent,
                  inactiveThumbColor: Colors.white,
                  hoverColor: Colors.black12,
                  value: isSwitched,
                  onChanged: (value) async {
                    if (value) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Vacation Mode On",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Vacation mode is on,order will not be processed,your restaurant will not visible on the app,turn back the vacation mode,when you're back to get it up and running",
                            ),
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
                                    isSwitched = value;
                                    print("The switched value is:$isSwitched");
                                  });
                                  final vacationSnapshot = await database
                                      .once();
                                  final data =
                                      vacationSnapshot.snapshot.value as Map?;
                                  if (data != null && data.isNotEmpty) {
                                    await database
                                        .update({"vacation": isSwitched})
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
                                    await database
                                        .set({"vacation": isSwitched})
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
                                child: Text("Done"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      setState(() {
                        isSwitched = value;
                      });
                      final vacationSnapshot = await database.once();
                      final data = vacationSnapshot.snapshot.value as Map?;
                      if (data != null && data.isNotEmpty) {
                        await database
                            .update({"vacation": isSwitched})
                            .then((value) {
                              Utils().toastMessage("Update Successfully");
                            })
                            .onError((error, stackTrace) {
                              Utils().toastMessage(error.toString());
                            });
                      } else {
                        await database
                            .set({"vacation": isSwitched})
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
                Text("OFF"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
