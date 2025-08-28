import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  String? id;
  final DatabaseRef = FirebaseDatabase.instance.ref("UserDetail");
  User? user = FirebaseAuth.instance.currentUser;

  void logout() {
    auth
        .signOut()
        .then((_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestoApp()),
          );
          Utills().toastmessage("LogOut Successfully");
        })
        .onError((error, stackTrace) {
          Utills().toastmessage(error.toString());
        });
  }

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: DatabaseRef.child(id!).onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final data = Map<String, dynamic>.from(
                  snapshot.data!.snapshot.value as Map,
                );
                return ListView(
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
                      title: Text(
                        "Full Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data["Full name"] ?? ""),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      title: Text(
                        "Email Address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data["Email address"] ?? ""),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      title: Text(
                        "Phone Number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data["Phone number"] ?? ""),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      title: Text(
                        "Address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data["Address"] ?? ""),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeleteAccount(),
                          ),
                        );
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
                      title: Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.logout),
                      onTap: logout,
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
