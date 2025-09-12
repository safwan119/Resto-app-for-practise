import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';

class NameDescDatabase extends StatefulWidget {
  const NameDescDatabase({super.key});

  @override
  State<NameDescDatabase> createState() => _NameDescDatabaseState();
}

class _NameDescDatabaseState extends State<NameDescDatabase> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.ref("Name Desc");
  bool loading = false;

  @override
  void initState() {
    super.initState();
    dataEntry();
  }

  Future<void> dataEntry() async {
    final nameDescData = await databaseReference.once();
    final data = nameDescData.snapshot.value as Map?;
    if (data != null && data.isNotEmpty) {
      nameController.text = data["name"] ?? " ";
      descriptionController.text = data["description"] ?? " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Description Added"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Restaurant Name Here..",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Enter Restaurant Description Here..",
              ),
            ),
            SizedBox(height: 10),
            RoundedButton(
              title: "Save Changes",
              loading: loading,
              ontap: () async {
                setState(() {
                  loading = true;
                });
                final restaurantData = await databaseReference.once();
                final data = restaurantData.snapshot.value as Map?;
                print("Data in this is :$data");
                if (data != null && data.isNotEmpty) {
                  await databaseReference
                      .update({
                        "name": nameController.text,
                        "description": descriptionController.text,
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
                  await databaseReference
                      .set({
                        "name": nameController.text,
                        "description": descriptionController.text,
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
      ),
    );
  }
}
