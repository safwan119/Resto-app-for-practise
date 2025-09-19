import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/notification/notification_services.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
class NotificationSendScreen extends StatefulWidget {
  const NotificationSendScreen({super.key});

  @override
  State<NotificationSendScreen> createState() => _NotificationSendScreenState();
}

class _NotificationSendScreenState extends State<NotificationSendScreen> {
  NotificationServices notificationServices=NotificationServices();
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
  User? user=FirebaseAuth.instance.currentUser;
  String? id;
  @override
  void initState() {
    super.initState();
    if(user!=null){
      id=user!.uid;
      OneSignal.login(id!);
      if (kDebugMode) {
        print("OneSignal ${OneSignal.login(id!)} user logged in with UID: $id");
      }
    }else{
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
            SizedBox(height: 10,),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter description for notification..",
                label: Text("desc*"),
              ),
            ),
            SizedBox(height: 10,),
            RoundedButton(title: "Send Notification", ontap: ()async{
            await notificationServices.sendNotification(titleController.text, descriptionController.text,id!);
            })
          ],
        ),
      ),
    );
  }
}
