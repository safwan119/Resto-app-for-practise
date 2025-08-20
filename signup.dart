import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  // void initState() {
  //
  //   super.initState();
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RestoApp()));
  // }
  var email = TextEditingController();
  var Password = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        title: Column(
          children: [
            Text(
              "RESTO.COM",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 170,
              height: 30,
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
                    fontSize: 16,
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
      body: Container(
        // width: 1000,
        // height: 1000,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: Text(
                      "Get your free account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 255),
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
                Container(
                  height: 200,
                  width: 500,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "hello@example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 10,
                  // margin: EdgeInsets.only(top: 0, bottom: 10),
                  padding: EdgeInsets.only(bottom: 1),
                ),
                // SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 255),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 500,
                  child: TextField(
                    controller: Password,
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 500,
                  child: TextField(
                    controller: Password,
                    decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
