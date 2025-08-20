import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/resPass.dart';
import 'package:my_first_proj/adreDeta.dart';
import 'package:my_first_proj/utill/utills.dart';

import 'drawer/drawer.dart';

class ForgPass extends StatefulWidget {
  const ForgPass({super.key});

  @override
  State<ForgPass> createState() => _ForgPassState();
}

class _ForgPassState extends State<ForgPass> {
  final auth=FirebaseAuth.instance;
  bool loading =false;
  final formkey=GlobalKey<FormState>();
  var email1 = TextEditingController();
  void ForgetPassword(){
    setState(() {
      loading=true;
    });
    auth.sendPasswordResetEmail(email: email1.text).then((value){
      setState(() {
        loading=false;
      });
      Utills().toastmessage("Email send successfully");
    }).onError((error,stackTrace){
      Utills().toastmessage(error.toString());
      setState(() {
        loading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                borderRadius: BorderRadius.circular(25), // Half of the height
              ),

              // decoration: BoxDecoration(
              //
              //   ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.yellow,
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
     // endDrawer:  Drawer(
     //
     // ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             Align(alignment: Alignment.centerLeft,
               child: IconButton(
                   style:IconButton.styleFrom(backgroundColor: Colors.white,

                       shape: CircleBorder()
                   ) ,
                   onPressed: (){
                 Navigator.pop(context);

               }, icon: Icon(Icons.arrow_back_outlined,)
               ),
             ),
              SizedBox(height: 30),
              Align(alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Forget your password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 6,),
              Form(key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email1,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter email";
                      }
                      else if(!value.contains("@") || !value.contains(".com")){
                        return "Enter a valid email";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your registration email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black), // Default color
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), // Color when focused
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
               InkWell(
                 child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Center(
                        child:loading?CircularProgressIndicator(strokeWidth: 4,color: Colors.white,): Text(
                          "Reset Password",
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                 onTap: (){

                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>ResPasCode()));
                    if(formkey.currentState!.validate()){
                      ForgetPassword();
                    }
                 },
               ),

              SizedBox(height: 8),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 // SizedBox(width: 100,),
                 IconButton(icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RestoApp()));
                 },

                 ),
                 Text("Back to Login", style: TextStyle(fontSize: 17)
                 ),
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
