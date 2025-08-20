import 'package:flutter/material.dart';
import 'package:my_first_proj/newPass.dart';
import 'package:my_first_proj/adreDeta.dart';

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
      endDrawer: Drawer(
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

              },
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){
                                Navigator.pop(context);

                            }, icon: Icon(Icons.arrow_back_outlined)
                            ),
                ),
              ),

              SizedBox(height: 30),
              Wrap(
                  children:[ Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Password Reset Code",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),

                ),

              // SizedBox(height: 3,),
              Row(
                children: [
                  SizedBox(width: 6,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("We sent a code to", style: TextStyle(fontSize: 17)),
                  ),
                  // SizedBox(width: 12,),
                  Text(
                    "example@resto.com",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2,),
            Row(
              children: [
                SizedBox(width: 15,),
               Container(
                 width: 60,
                 height: 60,
                 child: TextField(
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7),topLeft: Radius.circular(7),topRight: Radius.circular(7)),


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
                SizedBox(width: 8,),
                Container(
                  width: 60,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7),topLeft: Radius.circular(7),topRight: Radius.circular(7)),


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
                SizedBox(width: 9,),
                Container(
                  width: 60,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7),topLeft: Radius.circular(7),topRight: Radius.circular(7)),


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
                SizedBox(width: 8,),
                Container(
                  width: 60,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7),topLeft: Radius.circular(7),topRight: Radius.circular(7)),


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
                SizedBox(width: 8,),
                Container(
                  width: 60,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7),topLeft: Radius.circular(7),topRight: Radius.circular(7)),


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
              ],
            ),
              SizedBox(height: 12,),

              Align(alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPass()));
                    },

                    child: Container(
                      width: double.infinity,
                      height: 40,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),

                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Didn't receive a code?"),
                  SizedBox(width: 4,),
                  InkWell(child: Text("Click here to resend code",style: TextStyle(color: Colors.blue),),
                  onTap: (){},
                  )
                ],
              ),

            ],
          ),]
                    ),
      ),),
    );
  }
}
