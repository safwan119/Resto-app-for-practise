import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';
import 'cloudinary_sevice/cloudinary.dart';

class SubmitReview extends StatefulWidget {
  const SubmitReview({super.key});

  @override
  State<SubmitReview> createState() => _SubmitReviewState();
}

class _SubmitReviewState extends State<SubmitReview> {
  final databaseReference=FirebaseDatabase.instance.ref("Star and Review");
  User? user=FirebaseAuth.instance.currentUser;
  String? id;
  double _rating = 0.0;
  var reviewController = TextEditingController();
  String? imageUrl;
  var itemIndex = 0;
  File? image;
  final picker = ImagePicker();

  Future<void> imageGallery() async {
    final imagePicker = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (imagePicker != null) {
        image = File(imagePicker.path);
      } else {
        print("No image picked from Gallery");
      }
    });
  }

  Future<void> uploadImages() async {
    if (image != null) {
      final cloudinaryUrls = await Cloudinary().uploadImage(XFile(image!.path));
      setState(() {
        if (cloudinaryUrls != null) {
          imageUrl = cloudinaryUrls;
        }
      });
    }
  }
  @override
  void initState() {
    super.initState();
    if(user!=null){
      id=user!.uid;
      databaseReference
          .child(id!)
          .once()
          .then((snapshot) {
        final data = snapshot.snapshot.value as Map?;
        if (data != null) {
          reviewController.text = data["review"] ?? " ";
          imageUrl = data["image"] ?? " ";
          _rating= data["rating"] ?? "";
        }
      })
          .onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
      });
    }
    else{
      print("No user login now");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        title: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_outlined)),
            Column(
              children: [
                Text(
                  "RESTO.COM",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 160,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "MAKE FLASH ORDER",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Submit your review",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                SizedBox(width: 10),
                StarRating(
                  rating: _rating,
                  allowHalfRating: false,
                  onRatingChanged: (rating) => setState(() => _rating = rating),
                  size: 40,
                ),
              ],
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter review here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Attach image(optional)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  imageGallery();
                                },
                                icon: imageUrl != null
                                    ? Image.network(
                                        imageUrl!,
                                        fit: BoxFit.cover,
                                      )
                                    : image != null
                                    ? Image.file(
                                        image!.absolute,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image, size: 25),
                              ),
                            ),
                            Expanded(child: Text("ADD IMAGE")),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/image/restorant_food.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/image/restorant_another_food.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/image/restorant_food.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                title: "Submit Review",
                ontap: () async {
                  await uploadImages();
                  final reviewSnapshot=await databaseReference.child(id!).once();
                  final allData=reviewSnapshot.snapshot.value as Map?;
                  if (allData != null && allData.isNotEmpty) {
                    await databaseReference
                        .child(id!)
                        .update({
                      "review": reviewController.text,
                      "image": imageUrl,
                      "rating": _rating,
                    })
                        .then((value) {
                      Utils().toastMessage(
                        "User Detail Update Successfully",
                      );
                    })
                        .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  } else {
                    await databaseReference
                        .child(id!)
                        .set({
                      "review": reviewController.text,
                      "image": imageUrl,
                      "rating": _rating,
                    })
                        .then((value) {
                      Utils().toastMessage("User Detail Set Successfully");
                    })
                        .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
