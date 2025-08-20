
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:image_picker/image_picker.dart';

import 'cloudinary_sevice/cloudinary.dart';

class SubmitReview extends StatefulWidget{
  @override
  State<SubmitReview> createState() => _SubmitReviewState();
}

class _SubmitReviewState extends State<SubmitReview> {
  double _rating=0.0;
  var review=TextEditingController();
  String? imageUrl;
  var itemIndex=0;
  File? image;
  final picker=ImagePicker();
  Future<void> ImageGallery()async{
    final imagePicker=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
   setState(() {
     if(imagePicker!=null){
       image=File(imagePicker.path);
     }
     else{
       print("No image picked from Gallery");
     }
   });
  }
  Future<void> uploadImages()async{
     if(image!=null){
       final CloudinaryUrls=await Cloudinary().uploadImage(XFile(image!.path));
       setState(() {
         if(CloudinaryUrls!=null){
           imageUrl=CloudinaryUrls;
         }
       });
     }
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
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
              width: 150,
              height: 25,
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
                    // backgroundColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.yellow,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,

                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, size: 20, grade: 12),
                ),
              ),
            ),
            SizedBox(height: 35),
            ListTile(
              title: Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
              },
            ),
            ListTile(
              title: Text(
                "RESTO.COM Bussiness",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Help Centre",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Privacy&Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "LogOut",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,

        onTap: (index) {
          setState(() {
            itemIndex = index;
          });
        },
        currentIndex: itemIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activity",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: "Finance",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("Submit your review",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  StarRating(
                    rating: _rating,
                    allowHalfRating: false,
                    onRatingChanged: (rating) => setState(() =>_rating= rating),
                    size: 40,
                  ),
                  
                  // IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amber,size: 30,)),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amber,size: 30,)),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amber,size: 30,)),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.black12,size: 30,)),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.black12,size: 30,)),
                ],
              ),

              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: review,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter review here...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 133),
                child: Text("Attach image(optional",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
              ),
              SizedBox(height: 4,),
              Wrap(
                // crossAxisCount: 2,
                // spacing: 6,
                // runSpacing: 6,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 176,
                      height: 140,
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
                              child: IconButton(onPressed: (){
                                    ImageGallery();
                              }, icon:imageUrl!=null?Image.network(imageUrl!,fit: BoxFit.cover,):image!=null?Image.file(image!.absolute,fit: BoxFit.cover,): Icon(Icons.image,size: 25,)),
                            ),
                            Expanded(child: Text("ADD IMAGE")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    width: 176,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/image/picture.jpg",
                      fit: BoxFit.cover,
                      ),
                    ),
                                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 176,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),

                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/image/picture.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 176,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),

                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/image/picture.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ]
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: 390,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber
                    ),
                   child: Center(child: Text("Submit review",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

                  ),
                ),
                onTap: (){
                    uploadImages();
                },
              ),
              SizedBox(height: 100,),
          
            ],
          ),
        ),
      ),
    );

  }
}