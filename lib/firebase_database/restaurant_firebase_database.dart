import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/cloudinary_sevice/cloudinary.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/utill/utills.dart';
class RestaurantFirebaseDatabase extends StatefulWidget {
  const RestaurantFirebaseDatabase({super.key});

  @override
  State<RestaurantFirebaseDatabase> createState() => _RestaurantFirebaseDatabaseState();
}

class _RestaurantFirebaseDatabaseState extends State<RestaurantFirebaseDatabase> {
  bool loading =false;
  final titleController=TextEditingController();
  final subtitleController=TextEditingController();
  final halaHaramController=TextEditingController();
  final FirebaseDb=FirebaseDatabase.instance.ref("Restaurant");
  // final firestore=FirebaseFirestore.instance.collection("Restaurant");
  File? image;
  final picker=ImagePicker();
  String? ImageUrl;
  Future<void> ImageGallery()async{
    final imagePicker=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(imagePicker!=null){
        image=null;
        ImageUrl=null;
        image=File(imagePicker.path);
      }
    });
  }
  Future<void> UploadImages()async{
    if(image!=null) {
      final CloudinaryUrl = await Cloudinary().uploadImage(XFile(image!.path));

      setState(() {
        if (CloudinaryUrl != null) {
            ImageUrl=CloudinaryUrl;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Firebase Database"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller:titleController,
                decoration: InputDecoration(
                  hintText: "Enter title of Restaurant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                controller:subtitleController,
                decoration: InputDecoration(
                    hintText: "Enter Subtitle of Restaurant",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),
              SizedBox(height: 10,),
          TextFormField(
          controller:halaHaramController,
          decoration: InputDecoration(
              hintText: "Enter halal/Non-halal",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )
          ),
              ),
              SizedBox(height: 10,),
              InkWell(onTap: (){
                ImageGallery();
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ImageUrl != null
                      ? Image.network(ImageUrl!,fit: BoxFit.cover,)
                      : image != null
                      ? Image.file(image!.absolute,fit: BoxFit.cover,)
                      :Center(child: Icon(Icons.image,color: Colors.black,)),
                ),
              ),
              SizedBox(height: 10,),
              RoundedButton(title: "Add data",loading: loading, ontap: ()async{
                setState(() {
                  loading=true;
                });
              await  UploadImages();
                String id=DateTime.now().millisecondsSinceEpoch.toString();
                FirebaseDb.child(id).set({
                  "title":titleController.text.toString(),
                  "subtitle":subtitleController.text.toString(),
                    "halalOrNonHalal":halaHaramController.text.toString(),
                  "image":ImageUrl,
                }).then((context){
                  setState(() {
                    loading=false;
                  });
                  Utills().toastmessage("FirebaseDatabase Added");
                }).onError((error,stackTrace){
                  Utills().toastmessage((error.toString()));
                  setState(() {
                    loading=false;
                  });
                });
              }),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
