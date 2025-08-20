
import 'package:flutter/material.dart';

class ShowDailog extends StatefulWidget{
  @override
  State<ShowDailog> createState() => _ShowDailogState();
}

class _ShowDailogState extends State<ShowDailog> {
  DateTime? showdate;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Muhammad Safwan",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Text("Logout your Account"),
          InkWell(child: Text("Logout",style: TextStyle(color: Colors.amber),),
              onTap:

                  ()   {
               showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                 title: Text("Do You Want to logout"),
                 content: Text("Logout from the app And Sign up again"),
                 actions: [
                   TextButton(onPressed: (){
                     Navigator.pop(context);
                   }, child: Text("Cancel")),
                   TextButton(onPressed: (){

                     Navigator.pop(context);
                   }, child: Text("Logout"))
                 ],
               )) ;                 }),
        ],
      ),
    );

  }
}