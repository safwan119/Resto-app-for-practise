import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/utill/utills.dart';

import '../adreDeta.dart';
class Drawer1 extends StatelessWidget {
  // const Drawer1({super.key});
  final auth=FirebaseAuth.instance;

  @override
  void Logout(){
    auth.signOut().then((value){
      Utills().toastmessage("LogOut Successfully");
    }).onError((error,stackTrace){
      Utills().toastmessage(error.toString());
    });
  }
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: ListView(
        children: [
          Align(alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  style:IconButton.styleFrom(backgroundColor: Colors.white,

                      shape: CircleBorder()
                  ) ,
                  onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close,size: 20,grade: 12,)),
            ),
          ),
          SizedBox(height: 35,),
          ListTile(
            title: Text("My Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
            },
          ),
          ListTile(
            title: Text("RESTO.COM Bussiness",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Help Centre",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Privacy&Policy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("LogOut",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.logout),
            onTap: (){
              Logout();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RestoApp()));
            },
          )
        ],
      ),
    );
  }
}
