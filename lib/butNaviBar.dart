// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_proj/searBAr.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtNavigaBar extends StatefulWidget{
  const ButtNavigaBar({super.key});

  @override
  State<ButtNavigaBar> createState() => _ButtNavigaBarState();
}

class _ButtNavigaBarState extends State<ButtNavigaBar> {
   var itemindex=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Navigation Bar"),
        backgroundColor: Colors.amber,
      ),
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
         onTap: (index){
           setState(() {
             itemindex=index;

           });
         },
         currentIndex: itemindex,
         items: [
       BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
     ]),
    );
  }
}