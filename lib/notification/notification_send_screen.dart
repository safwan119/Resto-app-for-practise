import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/notification/notification_services.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';

class NotificationSendScreen extends StatefulWidget {
  const NotificationSendScreen({super.key});

  @override
  State<NotificationSendScreen> createState() => _NotificationSendScreenState();
}

class _NotificationSendScreenState extends State<NotificationSendScreen> {
  final firebaseDatabase = FirebaseDatabase.instance.ref("User UID");
  String? selectedValue;
  String selectedOption = "Selected User";
  bool isOpen = false;
  NotificationServices notificationServices = NotificationServices();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
      if (kDebugMode) {
        print("OneSignal user logged in with UID: $id");
      }
    } else {
      if (kDebugMode) {
        print("No user login now");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Send Screen"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title for notification..",
                label: Text("title*"),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter description for notification..",
                label: Text("desc*"),
              ),
            ),
            SizedBox(height: 20,),
            StreamBuilder(
              stream: firebaseDatabase.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.children.isEmpty) {
                  return Text("No data available");
                }
                if (snapshot.hasError) {
                  return Text("An error occurred");
                }
                List<String> userList = ['All Subscribers'];
                final data = snapshot.data!.snapshot.value as Map?;
                if (data != null) {
                  data.values.forEach((item) {
                    if (item is Map) {
                      userList.add(item["UID"].toString());
                    }
                  });
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          isOpen = !isOpen;
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.black12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(selectedOption),
                                isOpen
                                    ? Icon(Icons.arrow_drop_up)
                                    : Icon(Icons.arrow_drop_down_sharp),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isOpen)
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            final String itemName = userList[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.black12,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    isOpen = false;
                                    selectedOption = itemName;
                                    setState(() {});
                                  },
                                  child: Text(itemName),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            RoundedButton(
              title: "Send Notification",
              ontap: () async {
                if (selectedOption == 'Selected User' ||
                    selectedOption.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please select a user to send the notification to.',
                      ),
                    ),
                  );
                  return;
                }
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Title and description cannot be empty.'),
                    ),
                  );
                  return;
                }
                await notificationServices.sendNotification(
                  titleController.text,
                  descriptionController.text,
                  selectedOption,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
