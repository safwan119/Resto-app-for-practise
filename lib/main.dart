import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_first_proj/asian_food_menu/asian_menu.dart';
import 'package:my_first_proj/practise/restaurant_menu_practise.dart';
import 'package:my_first_proj/signUp1.dart';
import 'package:my_first_proj/resPass.dart';
import 'package:my_first_proj/forPass.dart';
import 'package:my_first_proj/newPass.dart';
import 'package:my_first_proj/drawer.dart';
import 'package:my_first_proj/adreDeta.dart';
import 'package:my_first_proj/searBAr.dart';
import 'package:my_first_proj/butNaviBar.dart';
import 'package:my_first_proj/foodPic.dart';
import 'package:my_first_proj/seperateImagfood.dart';
import 'package:my_first_proj/bkTabl.dart';
import 'package:my_first_proj/searchPic.dart';
import 'package:my_first_proj/review.dart';
import 'package:my_first_proj/revOrder.dart';
import 'package:my_first_proj/payment.dart';
import 'package:my_first_proj/payment1.dart';
import 'package:my_first_proj/splash_screen/splash_screen.dart';
import 'package:my_first_proj/tabBar.dart';
import 'package:my_first_proj/rateRest.dart';
import 'package:my_first_proj/submRev.dart';
import 'package:my_first_proj/utill/utills.dart';
import 'package:my_first_proj/waleBalan.dart';
import 'package:my_first_proj/topUp.dart';
import 'package:my_first_proj/topUp1.dart';
import 'package:my_first_proj/topUp2.dart';
import 'package:my_first_proj/deletAcc.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: RestaurantMenuPractise(),
    );
  }
}

class RestoApp extends StatefulWidget {
  const RestoApp({super.key});

  @override
  State<RestoApp> createState() => _RestoAppState();
}

class _RestoAppState extends State<RestoApp> {
  var email = TextEditingController();
  var passsword = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isobsecur = true;
  final auth = FirebaseAuth.instance;
  bool loading = false;

  void Login() {
    setState(() {
      loading = true;
    });
    auth
        .signInWithEmailAndPassword(email: email.text, password: passsword.text)
        .then((value) {
          setState(() {
            loading = false;
          });
          User? user=value.user;
          if(user!=null){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPicture()));
          }
          Utills().toastmessage("Login Successfully");
        })
        .onError((error, stackTrace) {
          Utills().toastmessage(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text(
                  "RESTO.COM",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Container(height: 0),
                Container(
                  width: 170,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "MAKE FLASH ORDER",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),

                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter email";
                              } else if (!value.contains("@") ||
                                  !value.contains(".com")) {
                                return "Enter a valid email";
                              } else {
                                return null;
                              }
                            },
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "hello@example.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                            controller: passsword,
                            obscureText: isobsecur,
                            decoration: InputDecoration(
                              hintText: "Your Password",
                              suffixIcon: IconButton(
                                icon: isobsecur
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isobsecur = !isobsecur;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8),
                InkWell(
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgPass()),
                    );
                  },
                ),

                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Login();
                      }
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Center(
                        child: loading
                            ? CircularProgressIndicator(
                                strokeWidth: 4,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 6),

                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },

                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black),

                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.contact_emergency),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "CREATE AN ACCOUNT",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Resto.com uses cookies for analytics and personalized Contacts and ads.By using resto.com servises you agree to this use of cookies. ",
                          ),
                          WidgetSpan(
                            child: InkWell(
                              child: Text(
                                "Learn more ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
