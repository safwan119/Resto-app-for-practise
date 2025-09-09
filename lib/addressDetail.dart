import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/drawer/drawer2.dart';
import 'package:my_first_proj/util/utills.dart';

class AddressDetail extends StatefulWidget {
  const AddressDetail({super.key});

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  final dbRef = FirebaseDatabase.instance.ref("UserDetail");
  var itemIndex = 0;
  bool loading = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var phoneNoController = TextEditingController();
  var addressController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String? id;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      id = user!.uid;
      dbRef
          .child(id!)
          .once()
          .then((snapshot) {
            final data = snapshot.snapshot.value as Map?;
            if (data != null) {
              fullNameController.text = data["Full name"] ?? "";
              emailAddressController.text = data["Email address"] ?? "";
              phoneNoController.text = data["Phone number"] ?? "";
              addressController.text = data["Address"] ?? "";
            }
          })
          .onError((error, stackTrace) {
            Utils().toastMessage(error.toString());
          });
    } else {
      print("No User login now");
    }
  }

  void dispose() {
    fullNameController.dispose();
    emailAddressController.dispose();
    phoneNoController.dispose();
    addressController.dispose();
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
              width: 150,
              height: 25,
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
      endDrawer: Drawer2(),
      // bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Full name",
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
                        controller: fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your full name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Email address",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailAddressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Phone number",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneNoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+92 | 1234567234",

                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your address",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: loading
                          ? CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Colors.white,
                            )
                          : Text(
                              "Save changes",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    if (id != null) {
                      dbRef.child(id!).once().then((snapshot) async {
                        final data = snapshot.snapshot.value as Map?;
                        if (data != null && data.isNotEmpty) {
                          await dbRef
                              .child(id!)
                              .update({
                                "Full name": fullNameController.text,
                                "Email address": emailAddressController.text,
                                "Phone number": phoneNoController.text,
                                "Address": addressController.text,
                              })
                              .then((value) {
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastMessage("Your details updated");
                              })
                              .onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                                setState(() {
                                  loading = false;
                                });
                              });
                        }
                        await dbRef
                            .child(id!)
                            .set({
                              "Full name": fullNameController.text,
                              "Email address": emailAddressController.text,
                              "Phone number": phoneNoController.text,
                              "Address": addressController.text,
                            })
                            .then((value) {
                              setState(() {
                                loading = false;
                              });
                              Utils().toastMessage("Your details set");
                            })
                            .onError((error, stackTrace) {
                              Utils().toastMessage(error.toString());
                              setState(() {
                                loading = false;
                              });
                            });
                      });
                    } else {
                      print("Can't save any data because no User is logged in");
                    }
                  }
                },
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Colors.white,
                            )
                          : Text(
                              "Delete account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  dbRef
                      .child(id!)
                      .remove()
                      .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        Utils().toastMessage("Your detail removed");
                        emailAddressController.clear();
                        fullNameController.clear();
                        addressController.clear();
                        phoneNoController.clear();
                      })
                      .onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                        setState(() {
                          isLoading = false;
                        });
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
