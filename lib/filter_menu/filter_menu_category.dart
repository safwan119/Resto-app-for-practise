import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_proj/cloudinary_sevice/cloudinary.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  final dataReference = FirebaseDatabase.instance.ref("Menu item");
  final dbReference = FirebaseDatabase.instance.ref("Restaurant Category");
  final databaseReference = FirebaseDatabase.instance.ref("Option1");
  final realtimeDatabaseReference = FirebaseDatabase.instance.ref("Option2");
  List<bool> isSelected = [];
  List<bool> isSelected1 = [];
  bool loading = false;
  final categoryController = TextEditingController();
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final title1Controller = TextEditingController();
  final title2Controller = TextEditingController();
  final addController = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  List<String> selectedCategories = [];
  String selectedCategory = '';
  File? image;
  final picker = ImagePicker();
  String? imageUrl;

  Future<void> imageFromGallery() async {
    final pickImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickImage != null) {
        image = null;
        imageUrl = null;
        image = File(pickImage.path);
      } else {
        return;
      }
    });
  }

  Future<void> uploadImage() async {
    final cloudinaryUrl = await Cloudinary().uploadImage(XFile(image!.path));
    setState(() {
      if (cloudinaryUrl != null) {
        imageUrl = cloudinaryUrl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Management"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Manage Restaurant Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: dbReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.white,
                      ),
                    );
                  }
                  if (!snapshot.hasData &&
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  final data = snapshot.data!.snapshot.value as Map;
                  List list = data.values.toList();

                  if (isSelected.length != list.length) {
                    isSelected=List.filled(list.length, false);
                  }
                  return SizedBox(
                    height: 270,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index]["category"]),
                          activeColor: Colors.amber,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isSelected[index],
                          onChanged: (value) {
                            setState(() {
                              isSelected[index] = value!;
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => _showDialogBox(),
                  child: Text(
                    "+ Add new category",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add Menu Items",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Enter Menu Name"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(hintText: "Enter Menu Description"),
              ),

              SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(hintText: "Enter price(RM X.XX)"),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu Image",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: imageUrl != null
                    ? Image.network(imageUrl!, fit: BoxFit.cover)
                    : image != null
                    ? Image.file(image!.absolute, fit: BoxFit.cover)
                    : Center(
                        child: TextButton(
                          onPressed: () {
                            imageFromGallery();
                          },
                          child: Text("Select"),
                        ),
                      ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Category for item",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: dbReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.white,
                      ),
                    );
                  }
                  if (!snapshot.hasData &&
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  final data = snapshot.data!.snapshot.value as Map;
                  List list = data.values.toList();

                  if (isSelected.length != list.length) {
                    isSelected = List.filled(list.length, false);
                  }
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index]["category"]),
                          activeColor: Colors.amber,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isSelected[index],
                          onChanged: (value) {
                            setState(() {
                              isSelected[index] = value!;
                              if (value) {
                                selectedCategories.add(list[index]["category"]);
                              } else {
                                selectedCategories.remove(
                                  list[index]["category"],
                                );
                              }
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Option 1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: title1Controller,
                decoration: InputDecoration(hintText: "Enter Title Here"),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: databaseReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.white,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  final data = snapshot.data!.snapshot.value as Map;
                  List list = data.values.toList();
                  if (isSelected1.length != list.length) {
                    isSelected1 = List.filled(list.length, false);
                  }
                  return SizedBox(
                    height: 170,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index]["option1"] ?? ""),
                          activeColor: Colors.amber,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isSelected1[index],
                          onChanged: (value) {
                            setState(() {
                              isSelected1[index] = !isSelected1[index];
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => _showDialogBox1(),
                  child: Text(
                    "+ Add new option",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Option 2",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: title2Controller,
                decoration: InputDecoration(hintText: "Enter Title Here"),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: realtimeDatabaseReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.white,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  final data = snapshot.data!.snapshot.value as Map;
                  List list = data.values.toList();
                  if (isSelected1.length != list.length) {
                    isSelected1 = List.filled(list.length, false);
                  }
                  return SizedBox(
                    height: 170,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index]["option2"] ?? ""),
                          activeColor: Colors.amber,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isSelected1[index],
                          onChanged: (value) {
                            setState(() {
                              isSelected1[index] = !isSelected1[index];
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => _showDialogBox2(),
                  child: Text(
                    "+ Add new option",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "+ Add new option section",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RoundedButton(
                loading: loading,
                title: "Add Menu",
                ontap: () async {
                  await uploadImage();
                  String? id = DateTime.now().millisecondsSinceEpoch.toString();
                  if (selectedCategories.isEmpty) {
                    Utils().toastMessage(
                      "Please select at least one category.",
                    );
                    return;
                  }
                  dataReference
                      .child(id)
                      .set({
                        "title1": title1Controller.text,
                        "title2": title2Controller.text,
                        "name": nameController.text,
                        "description": descController.text,
                        "price": priceController.text,
                        "image": imageUrl,
                        "category": selectedCategories.join(","),
                      })
                      .then((value) {
                        Utils().toastMessage("Added Successfully");
                      })
                      .onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogBox() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add new category"),
          content: TextFormField(
            controller: categoryController,
            decoration: InputDecoration(hintText: "Enter the category name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                dbReference
                    .child(id)
                    .set({"category": categoryController.text})
                    .then((value) {
                      Utils().toastMessage("Added Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogBox1() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add new option"),
          content: TextFormField(
            controller: option1Controller,
            decoration: InputDecoration(hintText: "Enter the option name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                databaseReference
                    .child(id)
                    .set({"option1": option1Controller.text})
                    .then((value) {
                      Utils().toastMessage("Added Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogBox2() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add new option"),
          content: TextFormField(
            controller: option2Controller,
            decoration: InputDecoration(hintText: "Enter the option name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                realtimeDatabaseReference
                    .child(id)
                    .set({"option2": option2Controller.text})
                    .then((value) {
                      Utils().toastMessage("Added Successfully");
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
