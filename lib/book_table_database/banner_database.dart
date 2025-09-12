import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/cloudinary_sevice/cloudinary.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';

class BannerDatabase extends StatefulWidget {
  const BannerDatabase({super.key});

  @override
  State<BannerDatabase> createState() => _BannerDatabaseState();
}

class _BannerDatabaseState extends State<BannerDatabase> {
  final databaseRef = FirebaseDatabase.instance.ref("Banner");
  bool loading = false;
  String? imageUrl;
  File? image;
  final picker = ImagePicker();

  Future<void> imageFromGallery() async {
    final pickImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickImage != null) {
        image = File(pickImage.path);
      } else {
        print("No image selected from gallery");
      }
    });
  }

  Future<void> uploadImage() async {
    final cloudinaryUrl = await Cloudinary().uploadImage(XFile(image!.path));
    setState(() {
      if (cloudinaryUrl != null) {
        imageUrl = cloudinaryUrl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Banner Database"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: IconButton(
                onPressed: () {
                  imageFromGallery();
                },
                icon: imageUrl != null
                    ? Image.network(imageUrl!, fit: BoxFit.cover)
                    : image != null
                    ? Image.file(image!.absolute, fit: BoxFit.cover)
                    : Text("Select"),
              ),
            ),
            RoundedButton(
              title: "Save",
              loading: loading,
              ontap: () async {
                setState(() {
                  loading = true;
                });
                await uploadImage();
                databaseRef
                    .set({"image": imageUrl})
                    .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage("Upload Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              },
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: databaseRef.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 4,
                    ),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.children.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                if (snapshot.hasError) {
                  return Text("Any error contain");
                }
                final data = Map<String, dynamic>.from(
                  snapshot.data!.snapshot.value as Map,
                );
                return Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(data["image"]),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        databaseRef.remove();
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
