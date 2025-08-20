import 'package:flutter/material.dart';

class AdresDetail extends StatefulWidget{
  const AdresDetail({super.key});

  @override
  State<AdresDetail> createState() => _AdresDetailState();
}

class _AdresDetailState extends State<AdresDetail> {
  var  itemIndex=0;
  var Fullname=TextEditingController();
  var Emailadr=TextEditingController();
  var phoneno=TextEditingController();
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
                     // backgroundColor: Colors.black,
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
       body: Padding(
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
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.only( bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),)
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
             // SizedBox(height: 20,),
             Align(
                 alignment: Alignment.centerLeft,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Email adress",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                 )),
             SizedBox(height:6,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 controller: Emailadr,
                 decoration: InputDecoration(
                     hintText: "Enter your email adress",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.only( bottomLeft: Radius.circular(12),
                           bottomRight: Radius.circular(12),
                           topLeft: Radius.circular(12),
                           topRight: Radius.circular(12),)
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
                 controller: phoneno,
                 decoration: InputDecoration(
                     hintText: "+92 | 1234567234",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.only( bottomLeft: Radius.circular(12),
                           bottomRight: Radius.circular(12),
                           topLeft: Radius.circular(12),
                           topRight: Radius.circular(12),)
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
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.only( bottomLeft: Radius.circular(12),
                           bottomRight: Radius.circular(12),
                           topLeft: Radius.circular(12),
                           topRight: Radius.circular(12),)
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
             SizedBox(height: 8,),
             InkWell(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width:double.infinity,
                   height: 50,
                   // color: Colors.black,
                   decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(12),
                       bottomRight: Radius.circular(12),
                       topLeft: Radius.circular(12),
                       topRight: Radius.circular(12),
                     ),
                   ),

                   child: Center(
                     child: Text(
                       "Save changes",
                       style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
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
                   height: 50,
                   // color: Colors.black,
                   decoration: BoxDecoration(
                     color: Colors.red,
                     borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(12),
                       bottomRight: Radius.circular(12),
                       topLeft: Radius.circular(12),
                       topRight: Radius.circular(12),
                     ),
                   ),

                   child: Center(
                     child: Text(
                       "Delete account",
                       style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
               ),
               onTap: (){},
             ),
           ],
         ),
       ),
     );
  }
}