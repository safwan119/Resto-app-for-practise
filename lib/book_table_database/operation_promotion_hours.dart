import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';

import '../util/utills.dart';

class OperationalPromotionalHours extends StatefulWidget {
  const OperationalPromotionalHours({super.key});

  @override
  State<OperationalPromotionalHours> createState() =>
      _OperationalPromotionalHoursState();
}

class _OperationalPromotionalHoursState
    extends State<OperationalPromotionalHours> {
  final databaseRef = FirebaseDatabase.instance.ref(
    "Operation Promotion Hours",
  );
  bool loading = false;
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  String? selectedValue5;
  String? selectedValue6;
  String? selectedValue7;
  String? selectedValue8;
  String? selectedValue9;
  String? selectedValue10;
  String? selectedValue11;
  String? selectedValue12;
  String? selectedValue13;
  String? selectedValue14;

  @override
  void initState() {
    super.initState();
    dataEntry();
  }

  Future<void> dataEntry() async {
    final nameDescData = await databaseRef.once();
    final data = nameDescData.snapshot.value as Map?;
    if (data != null && data.isNotEmpty) {
      selectedValue = data["sunToTuesOpen"] ?? " ";
      selectedValue1 = data["sunToTuesClose"] ?? " ";
      selectedValue2 = data["WedToThurOpen"] ?? " ";
      selectedValue3 = data["WedToThurClose"] ?? " ";
      selectedValue4 = data["weekEndOpen"] ?? " ";
      selectedValue5 = data["weekEndClose"] ?? " ";
      selectedValue6 = data["sunOpenOff"] ?? " ";
      selectedValue7 = data["sunCloseOff"] ?? " ";
      selectedValue8 = data["sunOff"] ?? " ";
      selectedValue9 = data["monOpenOff"] ?? " ";
      selectedValue10 = data["monCloseOff"] ?? " ";
      selectedValue11 = data["monOff"] ?? " ";
      selectedValue12 = data["tueOpenOff"] ?? " ";
      selectedValue13 = data["tueCloseOff"] ?? " ";
      selectedValue14 = data["tueOff"] ?? " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operational and Promotional Hours Setting"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Operation Hours",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Text(
              "Sunday-\nTuesday:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  width: 110,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue,
                      items:
                          <String>[
                            '8:00',
                            '9:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            "NotOp",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  width: 75,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue1,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                            "Not",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue1 = newValues;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Text(
              "Wednesday-\nThursday:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  width: 110,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue2,
                      items:
                          <String>[
                            '8:00',
                            '9:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            "NotOp",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue2 = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  width: 75,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue3,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                            "Not",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue3 = newValues;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Text(
              "Weekend:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  width: 110,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue4,
                      items:
                          <String>[
                            '8:00',
                            '9:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            "NotOp",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue4 = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  width: 110,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue5,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                            "Not",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue5 = newValues;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Promotional Hours",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "Sunday:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  height: 40,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue6,
                      items: <String>['8:00', '9:00', '10:00', '11:00', '12:00']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue6 = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  height: 40,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue7,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue7 = newValues;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  // width: 75,
                  height: 40,
                  color: Colors.amber,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue8,
                      items:
                          <String>[
                            '30% OFF',
                            '20% OFF',
                            '50% OFF',
                            '40% OFF',
                            '10% OFF',
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue8 = newValues;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Text(
              "Monday:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  height: 40,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue9,
                      items: <String>['8:00', '9:00', '10:00', '11:00', '12:00']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue9 = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  height: 40,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue10,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue10 = newValues;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  // width: 75,
                  height: 40,
                  color: Colors.amber,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue11,
                      items:
                          <String>[
                            '30% OFF',
                            '20% OFF',
                            '50% OFF',
                            '40% OFF',
                            '10% OFF',
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue11 = newValues;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Text(
              "Tuesday:",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            title: Row(
              children: [
                Container(
                  height: 40,
                  color: Colors.black12,

                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue12,
                      items: <String>['8:00', '9:00', '10:00', '11:00', '12:00']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue12 = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text("-"),
                SizedBox(width: 5),
                Container(
                  height: 40,
                  color: Colors.black12,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedValue13,
                      items:
                          <String>[
                            '15:00',
                            '16:00',
                            '17:00',
                            "18:00",
                            "19:00",
                            "20:00",
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          selectedValue13 = newValues;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    // width: 75,
                    height: 40,
                    color: Colors.amber,
                    child: Center(
                      child: DropdownButton<String>(
                        value: selectedValue14,
                        items:
                            <String>[
                              '30% OFF',
                              '20% OFF',
                              '50% OFF',
                              '40% OFF',
                              '10% OFF',
                            ].map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (String? newValues) {
                          setState(() {
                            selectedValue14 = newValues;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RoundedButton(
            title: "Save",
            loading: loading,
            ontap: () async {
              setState(() {
                loading = true;
              });
              final operationPromotionalSetting = await databaseRef.once();
              final data = operationPromotionalSetting.snapshot.value as Map?;
              if (data != null && data.isNotEmpty) {
                await databaseRef
                    .update({
                      "sunToTuesOpen": selectedValue.toString(),
                      "sunToTuesClose": selectedValue1.toString(),
                      "WedToThurOpen": selectedValue2.toString(),
                      "WedToThurClose": selectedValue3.toString(),
                      "weekEndOpen": selectedValue4.toString(),
                      "weekEndClose": selectedValue5.toString(),
                      "sunOpenOff": selectedValue6.toString(),
                      "sunCloseOff": selectedValue7.toString(),
                      "sunOff": selectedValue8.toString(),
                      "monOpenOff": selectedValue9.toString(),
                      "monCloseOff": selectedValue10.toString(),
                      "monOff": selectedValue11.toString(),
                      "tueOpenOff": selectedValue12.toString(),
                      "tueCloseOff": selectedValue13.toString(),
                      "tueOff": selectedValue14.toString(),
                    })
                    .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage("update Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              } else {
                await databaseRef
                    .set({
                      "sunToTuesOpen": selectedValue.toString(),
                      "sunToTuesClose": selectedValue1.toString(),
                      "WedToThurOpen": selectedValue2.toString(),
                      "WedToThurClose": selectedValue3.toString(),
                      "weekEndOpen": selectedValue4.toString(),
                      "weekEndClose": selectedValue5.toString(),
                      "sunOpenOff": selectedValue6.toString(),
                      "sunCloseOff": selectedValue7.toString(),
                      "sunOff": selectedValue8.toString(),
                      "monOpenOff": selectedValue9.toString(),
                      "monCloseOff": selectedValue10.toString(),
                      "monOff": selectedValue11.toString(),
                      "tueOpenOff": selectedValue12.toString(),
                      "tueCloseOff": selectedValue13.toString(),
                      "tueOff": selectedValue14.toString(),
                    })
                    .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage("Set Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              }
            },
          ),
        ],
      ),
    );
  }
}
