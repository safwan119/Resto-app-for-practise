import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/restaurants_detail/restaurant_menu_detail.dart';
import 'package:my_first_proj/util/utills.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  var confirmPasswordController = TextEditingController();
  bool isObscure = true;
  final firebaseDatabase = FirebaseDatabase.instance.ref("User SignUp detail");
  String? id;

  void signUp2() async {
    setState(() {
      loading = true;
    });
    auth
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
        .then((value) {
          setState(() {
            loading = false;
          });
          User? user = value.user;
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RestaurantMenuDetail()),
            );
          }
          Utils().toastMessage("SignUp successfully");
        })
        .onError((error, stackTrace) {
          Utils().toastMessage(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  void ConfirmPassword1() {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter correct password")));
    } else {
      signUp2();
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
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
              width: 170,
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
      // endDrawer: Drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined),
                  ),
                ),
              ),
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
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
                        decoration: InputDecoration(
                          hintText: "hello@example.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Container(padding: EdgeInsets.only(bottom: 1)),
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
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Your Password",
                          suffixIcon: IconButton(
                            icon: isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ), // Color when focused
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm your Password",
                          suffixIcon: IconButton(
                            icon: isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ConfirmPassword1();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Center(
                      child: loading
                          ? CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Colors.white,
                            )
                          : Text(
                              "Create account",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: "Already have an account?"),
                      WidgetSpan(
                        child: InkWell(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestoApp(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
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
    );
  }
}
