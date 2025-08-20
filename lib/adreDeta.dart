import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';

import 'drawer/drawer.dart';

class AdresDetail extends StatefulWidget{
  const AdresDetail({super.key});

  @override
  State<AdresDetail> createState() => _AdresDetailState();
}

class _AdresDetailState extends State<AdresDetail> {
  var  itemIndex=0;
  var Fullname=TextEditingController();
  var Emailadr=TextEditingController();
  var phoneNoController=TextEditingController();
  var Email=TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
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
       bottomNavigationBar:BottomNavigatorBar1(),
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Full name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  )),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: Fullname,
                             decoration: InputDecoration(
                               hintText: "Enter your full name",
                               enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.black),
                                 borderRadius: BorderRadius.circular(12),// Default color
                               ),

                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.blue),
                                 borderRadius: BorderRadius.circular(12),// Color when focused
                               ),
                             ),
                 ),
               ),
               // SizedBox(height: 20,),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Email address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                   )),
               SizedBox(height:6,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: Emailadr,
                   decoration: InputDecoration(
                       hintText: "Enter your email address",
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black),
                       borderRadius: BorderRadius.circular(12),// Default color
                     ),

                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue),
                       borderRadius: BorderRadius.circular(12),// Color when focused
                     ),
                   ),
                 ),
               ),
               // SizedBox(height: 20,),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Phone number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                   )),
               SizedBox(height:4,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: phoneNoController,
                   decoration: InputDecoration(
                       hintText: "+92 | 1234567234",

                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black),
                       borderRadius: BorderRadius.circular(12),// Default color
                     ),

                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue),
                       borderRadius: BorderRadius.circular(12),// Color when focused
                     ),
                   ),
                 ),
               ),
               // SizedBox(height: 20,),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                   )),
               SizedBox(height:2,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: Email,
                   decoration: InputDecoration(
                       hintText: "Enter your email",
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black),
                       borderRadius: BorderRadius.circular(12),// Default color
                     ),

                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue),
                       borderRadius: BorderRadius.circular(12),// Color when focused
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 8,),
               InkWell(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     width:double.infinity,
                     height: 40,
                     // color: Colors.black,
                     decoration: BoxDecoration(
                       color: Colors.amber,
                       borderRadius: BorderRadius.circular(12),
                     ),

                     child: Center(
                       child: Text(
                         "Save changes",
                         style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                       ),
                     ),
                   ),
                 ),
                 onTap: (){},
               ),
               // SizedBox(height: 20,),
               InkWell(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     width:double.infinity,
                     height: 40,
                     // color: Colors.black,
                     decoration: BoxDecoration(
                       color: Colors.red,
                       borderRadius: BorderRadius.circular(12),
                     ),

                     child: Center(
                       child: Text(
                         "Delete account",
                         style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                       ),
                     ),
                   ),
                 ),
                 onTap: (){},
               ),
             ],
           ),
         ),
       ),
     );
  }
}