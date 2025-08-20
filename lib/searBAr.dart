import 'package:flutter/material.dart';
import 'package:my_first_proj/adreDeta.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SearchBar1 extends StatefulWidget{
  @override
  State<SearchBar1> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar1> {
  var  itemIndex=0;
  var Search=TextEditingController();
  void initState() {
    super.initState();
    Search.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context){
     // void initState() {
     //   super.initState();
     //   Search.addListener(() {
     //     setState(() {});
     //   });
     // }

     return Scaffold(
         appBar: AppBar(
           toolbarHeight: 128,
           title: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(height: 30,),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Text("Hello,Aiman",style: TextStyle(color: Colors.black,fontSize: 16),),
                   )),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Text("Let's Make a Flash Order",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                   ))
             ,
               SizedBox(height: 1,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 40,
                   child: TextField(
                     controller: Search,

                     decoration: InputDecoration(
                       hintText: "Search for food",
                         prefixIcon: Search.text.isEmpty
                             ? Icon(Icons.search, size: 29)
                             : null,

                         // prefixIcon: Icon(Icons.search,size: 20,),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9),
                           bottomRight: Radius.circular(9),
                           topLeft: Radius.circular(9),
                           topRight: Radius.circular(9),)
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
               )
           
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
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.amber,

         onTap: (index){
           setState(() {
             itemIndex=index;
           });

         },
         currentIndex: itemIndex,
         items: [

           BottomNavigationBarItem(icon: Icon(Icons.home),label: "Restaurants",),
           BottomNavigationBarItem(icon: Icon(Icons.local_activity),label: "Activity"),
           BottomNavigationBarItem(icon:Icon(Icons.monetization_on_rounded),label: "Finance",),
           BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",),
           BottomNavigationBarItem(icon: Icon(Icons.support),label: "Support"),
         ],
       ),
       body:Center(
      child:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Icon(Icons.sentiment_dissatisfied_rounded,size: 80,)
           ,
           SizedBox(height: 12,),
           Text("We couldn't find any results",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21),),
           SizedBox(height: 12,),
           Text("Try for different search keyword or look for your\n favorite dish at another restaurant")
         ],
       ),),
       );
   }
}