import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/adreDeta.dart';
import 'package:my_first_proj/utill/utills.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  
  var email = TextEditingController();
  var Password = TextEditingController();
  final formkey=GlobalKey<FormState>();
  bool loading=false;
  final auth=FirebaseAuth.instance;
  var ConfirmPassword = TextEditingController();
  bool isobsecure=true;
  @override
  void SignUp2(){
    setState(() {
      loading=true;
    });
    auth.createUserWithEmailAndPassword(email: email.text, password: Password.text).then((value){
      setState(() {
        loading=false;
      });
      Utills().toastmessage("SignUp successfully");
    }).onError((error,stackTrace){
      Utills().toastmessage(error.toString());
      setState(() {
        loading=false;
      });
    });
  }
  void  ConfirmPassword1(){
    if(Password.text!=ConfirmPassword.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter correct password")));
    }
    else{
      SignUp2();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              padding: const EdgeInsets.only(),
              child: IconButton(onPressed: (){
                Navigator.pop(context);

              }, icon: Icon(Icons.arrow_back_outlined)
              ),
            ),),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,

                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Get your free account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,

                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
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
              Form(key: formkey,
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter email";
                      }
                      else if(!value.contains("@") || !value.contains(".com")){
                        return "Enter a valid email";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "hello@example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),

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
                Container(

                  padding: EdgeInsets.only(bottom: 1),
                ),
                // SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
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
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Password,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter password";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      suffixIcon: IconButton(icon:isobsecure? Icon(Icons.visibility_off):Icon(Icons.visibility),onPressed: (){
                        setState(() {
                          isobsecure=!isobsecure;
                        });
                      },),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
                SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ConfirmPassword,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter password";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      suffixIcon: IconButton(icon:isobsecure? Icon(Icons.visibility_off):Icon(Icons.visibility),onPressed: (){
                        setState(() {
                          isobsecure=!isobsecure;
                        });
                      },),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
              ],)),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(onTap: (){
                   if(formkey.currentState!.validate()){
                     ConfirmPassword1();
                   }
                 },
                   child: Container(

                      height: 50,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Center(
                        child:loading?CircularProgressIndicator(strokeWidth: 4,color: Colors.white,):Text(
                          "Create acount",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: RichText(text: TextSpan(
                   style: TextStyle(color: Colors.black),
                   children: [
                     TextSpan(
                       text: "Already have an account?"
                     ),
                     WidgetSpan(child: InkWell(child: Text("Login",style: TextStyle(color: Colors.blue),),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>RestoApp()));
                     },
                     ),

                     )
                   ]
                 )),
               ),



              SizedBox(height: 50),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(

                  text:
                  "Resto.com uses cookies for analytics and personalized Contacts and ads.By using resto.com servises you agree to this use of cookies. ",
                ),
                WidgetSpan(child:
                InkWell(child: Text("Learn more ",style: TextStyle(color: Colors.blue),),
                  onTap: (){},

                ),
                )
              ]
          )),
        ),

            ],
          ),
        ),
      ),
    );
  }
}
