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
  final DatabaseRef=FirebaseDatabase.instance.ref("Restaurant Detail");
  final restaurantNameController=TextEditingController();
  bool loading=false;
  File? image;
  final picker=ImagePicker();
  String? imageUrl;
  Future<void> ImageFromgallery()async{
    final ImagePicker=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(ImagePicker!=null){
        image=null;
        // imageUrl=null;
        image=File(ImagePicker.path);
      }
      else{
        print("No Image Selected");
      }
    });
  }
  Future<void> UploadImages()async{
    String? CloudinaryUrl=await Cloudinary().uploadImage(XFile(image!.path));
    setState(() {
      if(CloudinaryUrl!=null){
        imageUrl=CloudinaryUrl;
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller:restaurantNameController,
              decoration: InputDecoration(
                hintText: "Enter the name of Restaurant",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black)
                ),
                child: imageUrl != null
                    ? Image.network(imageUrl!,fit: BoxFit.cover,)
                    : image != null
                    ? Image.file(image!.absolute,fit: BoxFit.cover,)
                    :Center(child: IconButton(onPressed: (){
                  ImageFromgallery();
                }, icon: Icon(Icons.image))),
              ),
           ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(title: "Add to FirebaseDatabase",loading: loading, ontap: ()async{
             await UploadImages();
              setState(() {
                loading=true;
              });
              final id=DateTime.now().millisecondsSinceEpoch.toString();
              DatabaseRef.child(id).set({
                "Name":restaurantNameController.text.toString(),
                "image":imageUrl.toString(),
              }).then((value){
                if (imageUrl == null || imageUrl!.isEmpty) {
                  print('Image URL is null or empty');
                  return;
                }
                setState(() {
                  loading=false;
                });
                Utills().toastmessage("Added Successfully");
              }).onError((error,stackTrace){
                Utills().toastmessage(error.toString());
                setState(() {
                  loading=false;
                });
                return null;
              });
            }),
          )
        ],
      ),

    );
  }
}
