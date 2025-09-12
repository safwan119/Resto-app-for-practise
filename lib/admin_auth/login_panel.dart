import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/admin_dashboard/dashboard.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
class LoginPanel extends StatefulWidget {
  const LoginPanel({super.key});

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final userNameController=TextEditingController();
  final passwordController=TextEditingController();
  final databaseReference=FirebaseDatabase.instance.ref("admin");
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Panel Login Access"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft,
                child: Text("Username",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
            ,TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                  hintText: "Enter Username Here"
              ),
            ),
            Align(alignment: Alignment.centerLeft,
                child: Text("Password",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
            ,TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter Password Here"
              ),
            ),
            RoundedButton(title: "Login", ontap: ()async{
              final snapshot=await databaseReference.get();
              if(snapshot.exists){
                String dbUser=snapshot.child("username").value.toString();
                String dbPassword=snapshot.child("password").value.toString();
                if(userNameController.text==dbUser && passwordController.text==dbPassword){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Username or Password")));
                }
              }
            })
          ],

        ),
      ),
    );
  }
}
