import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import '../deletAcc.dart';
import '../utill/utills.dart';
class Drawer2 extends StatefulWidget {
  const Drawer2({super.key});

  @override
  State<Drawer2> createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  final auth = FirebaseAuth.instance;
  final DatabaseRef = FirebaseDatabase.instance.ref("UserDetail");
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
      child: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: DatabaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                if (!snapshot.exists) return Container();
                return SizedBox(
                  height: 1000,
                  child: ListView(
                    children: [
                      SizedBox(height: 50),
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
                      SizedBox(height: 20),
                      ListTile(
                        title: Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(snapshot.child("Full name").value.toString()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text("Email Address", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(snapshot.child("Email address").value.toString()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(snapshot.child("Phone number").value.toString()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(snapshot.child("Address").value.toString()),
                        trailing: Icon(Icons.keyboard_arrow_right),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteAccount()));
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
