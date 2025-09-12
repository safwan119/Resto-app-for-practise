import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';

class AddressGoogleLink extends StatefulWidget {
  const AddressGoogleLink({super.key});

  @override
  State<AddressGoogleLink> createState() => _AddressGoogleLinkState();
}

class _AddressGoogleLinkState extends State<AddressGoogleLink> {
  final addressController = TextEditingController();
  final googleMapLinkController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.ref("Address and Link");
  bool loading = false;

  @override
  void initState() {
    super.initState();
    dataEntry();
  }

  Future<void> dataEntry() async {
    final addGoogleLinkData = await databaseReference.once();
    final data = addGoogleLinkData.snapshot.value as Map?;
    if (data != null && data.isNotEmpty) {
      addressController.text = data["address"] ?? " ";
      googleMapLinkController.text = data["googleMapLink"] ?? " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address and google map link"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              maxLines: 2,
              controller: addressController,
              decoration: InputDecoration(hintText: "Enter Address Here.."),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 2,
              controller: googleMapLinkController,
              decoration: InputDecoration(
                hintText: "Enter Google Map or Waze Link Here...",
              ),
            ),
            SizedBox(height: 10),
            RoundedButton(
              title: "Save",
              loading: loading,
              ontap: () async {
                setState(() {
                  loading = true;
                });
                final addressLinkSnapshot = await databaseReference.once();
                final data = addressLinkSnapshot.snapshot.value as Map?;
                if (data != null && data.isNotEmpty) {
                  await databaseReference
                      .update({
                        "address": addressController.text,
                        "googleMapLink": googleMapLinkController.text,
                      })
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage("Update Successfully");
                      })
                      .onError((error, stacktrace) {
                        Utils().toastMessage(error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                } else {
                  await databaseReference
                      .set({
                        "address": addressController.text,
                        "googleMapLink": googleMapLinkController.text,
                      })
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage("Set Successfully");
                      })
                      .onError((error, stacktrace) {
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
