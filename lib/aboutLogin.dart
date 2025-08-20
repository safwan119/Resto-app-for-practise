// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutLogin extends StatefulWidget{
  @override
  State<AboutLogin> createState() => _AdminState();
}

class _AdminState extends State<AboutLogin> {
    Widget build(BuildContext context){
      return Scaffold(
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               SizedBox(height: 8,),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Text("RESTO.COM",style: TextStyle(color: Colors.black,fontSize: 27,fontWeight: FontWeight.bold),)),

                 Align(alignment: Alignment.centerLeft,
                   child: Container(
                       width: 110,
                       height: 25,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(22),
                         color: Colors.black
                       ),
                     child: Center(child: Text("MAKE FLASH ORDER",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)),
                     ),
                 ),
               Padding(
                 padding: const EdgeInsets.only(right: 200,bottom: 200),
                 child: Container(
                   width: 1,
                   height: 1000,
                   child: LinearProgressIndicator(
                     backgroundColor: Colors.black,
                     value: 0,
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
      );

    }
}