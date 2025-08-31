import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/cloudinary_sevice/cloudinary.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/utill/utills.dart';

class FoodMenuDatabase extends StatefulWidget {
  const FoodMenuDatabase({super.key});

  @override
  State<FoodMenuDatabase> createState() => _FoodMenuDatabaseState();
}

class _FoodMenuDatabaseState extends State<FoodMenuDatabase> {
  final databaseReference = FirebaseDatabase.instance.ref("Restaurant Detail");
  final restaurantNameController = TextEditingController();
  bool loading = false;
  bool loading1 = false;
  File? image;
  final picker = ImagePicker();
  File? image1;
  final picker1 = ImagePicker();
  String? imageUrl;
  String? imageUrl1;

  Future<void> ImageFromgallery() async {
    final ImagePicker = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (ImagePicker != null) {
        image = null;
        image = File(ImagePicker.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future<void> UploadImages() async {
    String? CloudinaryUrl = await Cloudinary().uploadImage(XFile(image!.path));
    setState(() {
      if (CloudinaryUrl != null) {
        imageUrl = CloudinaryUrl;
      }
    });
  }

  Future<void> ImageFromgallery1() async {
    final ImagePicker1 = await picker1.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (ImagePicker1 != null) {
        image1 = null;
        imageUrl1 = null;
        image1 = File(ImagePicker1.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future<void> UploadImage1() async {
    String? CloudinaryUrl1 = await Cloudinary().uploadImage(
      XFile(image1!.path),
    );
    setState(() {
      if (CloudinaryUrl1 != null) {
        imageUrl1 = CloudinaryUrl1;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Firebase Database"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: restaurantNameController,
              decoration: InputDecoration(
                hintText: "Enter the name of Restaurant",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black),
              ),
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : image != null
                  ? Image.file(image!.absolute, fit: BoxFit.cover)
                  : Center(
                      child: IconButton(
                        onPressed: () {
                          ImageFromgallery();
                        },
                        icon: Icon(Icons.image),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: imageUrl1 != null
                  ? Image.network(imageUrl1!, fit: BoxFit.cover)
                  : image1 != null
                  ? Image.file(image1!.absolute, fit: BoxFit.cover)
                  : Center(
                      child: IconButton(
                        onPressed: () {
                          ImageFromgallery1();
                        },
                        icon: Icon(Icons.image),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              title: "add to firebaseDatabase",
              loading: loading,
              ontap: () async {
                await UploadImages();
                await UploadImage1();
                setState(() {
                  loading = true;
                });
                final id = DateTime.now().millisecondsSinceEpoch.toString();
                print('Saving image URL: $imageUrl');
                print('Saving image URL: $imageUrl1');
                databaseReference
                    .child(id)
                    .set({
                      "Name": restaurantNameController.text.toString(),
                      "image": imageUrl.toString(),
                      "image1": imageUrl1.toString(),
                    })
                    .then((value) {
                      if (imageUrl1 == null || imageUrl1!.isEmpty) {
                        print('Image URL is null or empty');
                        return;
                      }
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
                      return null;
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
