import 'package:flutter/material.dart';
import 'package:my_first_proj/new_password.dart';
import 'package:my_first_proj/addressDetail.dart';

class ResPasCode extends StatefulWidget {
  @override
  State<ResPasCode> createState() => _ResPasCodeState();
}

class _ResPasCodeState extends State<ResPasCode> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    fontSize: 15,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
              ),
            ),

            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password Reset Code",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Row(
              children: [
                Text("We sent a code to", style: TextStyle(fontSize: 17)),
                Text(
                  "example@resto.com",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: TextField1()),
                SizedBox(width: 4,),
                Expanded(child: TextField1()),
                SizedBox(width: 4,),
                Expanded(child: TextField1()),
                SizedBox(width: 4,),
                Expanded(child: TextField1()),
                SizedBox(width: 4,),
                Expanded(child: TextField1()),
              ],
            ),

            SizedBox(height: 12),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPass()),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                Text("Didn't receive a code?"),
                SizedBox(width: 4),
                InkWell(
                  child: Text(
                    "Click here to resend code",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7),
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Default color
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue), // Color when focused
          ),
        ),
      ),
    );
  }
}
