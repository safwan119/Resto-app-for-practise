// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/adreDeta.dart';

class NewPass extends StatefulWidget{
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  var pass1=TextEditingController();
  var pass=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
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
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: IconButton(
                style:IconButton.styleFrom(backgroundColor: Colors.white,

                    shape: CircleBorder()
                ) ,
                onPressed: (){
              Navigator.pop(context);

            }, icon: Icon(Icons.arrow_back_outlined)
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Set a new password",style: TextStyle(color: Colors.black,fontSize: 37,fontWeight: FontWeight.bold),),
              )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Password",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
          )
        ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pass,
             decoration: InputDecoration(
                 suffixIcon:IconButton(onPressed:(){

                 }, icon: Icon(Icons.remove_red_eye)) ,
               hintText: "Your password",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pass1,
              decoration: InputDecoration(
                suffixIcon:IconButton(onPressed:(){

                }, icon: Icon(Icons.remove_red_eye)) ,
                  hintText: "Confirm your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),
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
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black
                ),
                child: Center(child: Text("Reset Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold),)),
              ),
            ),
            onTap: (){},
          ),


        ],
      ),
    );
  }
}