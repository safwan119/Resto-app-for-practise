import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/cloudinary_sevice/cloudinary.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/utill/utills.dart';

class MenuDatabase extends StatefulWidget {
  const MenuDatabase({super.key});

  @override
  State<MenuDatabase> createState() => _MenuDatabaseState();
}

class _MenuDatabaseState extends State<MenuDatabase> {
  bool loading = false;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.ref("Restaurant Menu");
  File? image;
  final picker = ImagePicker();
  String? imageUrl;

  Future<void> imageFromGallery() async {
    final imagePicker = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (imagePicker != null) {
      image = File(imagePicker.path);
    } else {
      print("No image selected");
    }
  }

  Future<void> uploadImage() async {
    String? cloudinaryUrl = await Cloudinary().uploadImage(XFile(image!.path));
    if (cloudinaryUrl != null) {
      image = null;
      imageUrl = null;
      imageUrl = cloudinaryUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For Menu Database"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter menu name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descController,
              decoration: InputDecoration(
                hintText: "Enter menu description",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: "Enter price of menu",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : image != null
                  ? Image.file(image!.absolute, fit: BoxFit.cover)
                  : Center(
                      child: IconButton(
                        onPressed: () {
                          imageFromGallery();
                        },
                        icon: Icon(Icons.image),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              title: "Add to database",
              loading: loading,
              ontap: () async {
                await uploadImage();
                setState(() {
                  loading = true;
                });
                final id = DateTime.now().millisecondsSinceEpoch.toString();
                dbRef
                    .child(id)
                    .set({
                      "title": titleController.text.toString(),
                      "desc": descController.text.toString(),
                      "price": priceController.text.toString(),
                      "image": imageUrl.toString(),
                    })
                    .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Utills().toastmessage("Added Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utills().toastmessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
