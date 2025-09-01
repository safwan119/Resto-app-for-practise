
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/utill/utills.dart';

class DeleteAccount extends StatefulWidget{
  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  var itemIndex=0;
  var pass2=TextEditingController();
  var emailController=TextEditingController();
  final auth=FirebaseAuth.instance;
  User? user;
  void DeleteAccount1()async{
    user=await FirebaseAuth.instance.currentUser;
    if(user==null) {
      return;
    }
    bool confirm=await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Delete account"),
        content: Text("Are you sure to delete your account?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context,false);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            Navigator.pop(context, true);
          }, child: Text("Confirm"))
        ],
      );
    });
    if(confirm!=true)return;
    final credential=EmailAuthProvider.credential(email: emailController.text.trim(), password: pass2.text);
    try{
      await user!.reauthenticateWithCredential(credential);

    }on FirebaseAuthException catch(e){
      if(e.code=="wrong-password"){
        Utills().toastmessage("Incorrect Password");
      }
      else{
        Utills().toastmessage("Re_auth failed:${e.message}");
      }
    }
    try{
      await user!.delete();
      Utills().toastmessage("Account deleted successfully.");
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => RestoApp()),
      );
    } on FirebaseAuthException catch (e) {
      Utills().toastmessage("Delete failed: ${e.message}");

    }
  }
  Widget build(BuildContext contex){
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
              width: 170,
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
        backgroundColor: Colors.amber,
      ),

      endDrawer: Drawer1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                child: IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.white,shape:CircleBorder()),
                    onPressed: (){
                    Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back,size: 30,)),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Enter your password",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Email",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter your current email",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Password",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: pass2,
                decoration: InputDecoration(
                  hintText: "Enter password to delete your account",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: Card(
                  child: InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
        
                      ),
                      child: Center(child: Text("Delete Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
        
        
                    ),
                    onTap: (){
                DeleteAccount1();
                    },
                  ),
                ),
             ),
        
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                }, icon: Icon(Icons.arrow_back_outlined)),
                Text("Back",style: TextStyle(fontSize: 19),),
              ],
            )
        
          ],
        ),
      ),
    );

  }
}