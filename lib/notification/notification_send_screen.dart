import 'package:flutter/material.dart';
import 'package:my_first_proj/notification/notification_services.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
class NotificationSendScreen extends StatefulWidget {
  const NotificationSendScreen({super.key});

  @override
  State<NotificationSendScreen> createState() => _NotificationSendScreenState();
}

class _NotificationSendScreenState extends State<NotificationSendScreen> {
  NotificationServices notificationServices=NotificationServices();
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
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
            await notificationServices.sendNotification(titleController.text, descriptionController.text);
            })
          ],
        ),
      ),
    );
  }
}
