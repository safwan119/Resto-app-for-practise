import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/utill/utills.dart';
import '../adreDeta.dart';
import '../deletAcc.dart';
import '../main.dart';

class Drawer1 extends StatefulWidget {
  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final auth=FirebaseAuth.instance;
  void logout() {
    auth.signOut().then((_) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RestoApp()));

      Utills().toastmessage("LogOut Successfully");
    }).onError((error,stackTrace) {
      Utills().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child:  ListView(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  "My profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
                },
              ),
              ListTile(
                title: Text(
                  "RESTO.COM Business",
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
                  "Delete account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  DeleteAccount();
                },
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
                title: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.logout),
                onTap: logout,
              ),
              SizedBox(height: 20),
            ],
          ),
    );
  }
}

