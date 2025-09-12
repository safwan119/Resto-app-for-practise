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
  List<bool> isObscure = [];
  final nameUpdateController = TextEditingController();
  final descUpdateController = TextEditingController();
  final priceUpdateController = TextEditingController();
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
  String? id3=DateTime.now().millisecondsSinceEpoch.toString();
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
    if (image == null) {
      print('Image is null, cannot upload.');
      return;
    }
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
        backgroundColor: Colors.black12,
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
                  if (selectedCategories.isEmpty) {
                    Utils().toastMessage(
                      "Please select at least one category.",
                    );
                    return;
                  }
                  dataReference
                      .child(id3!)
                      .set({
                       "id":id3,
                        "title1": title1Controller.text,
                        "title2": title2Controller.text,
                        "name": nameController.text,
                        "description": descController.text,
                        "price": priceController.text,
                        "image": imageUrl,
                        "category": selectedCategories.join(","),
                         "visibility":false
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
              StreamBuilder(
                stream: dataReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.black,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }

                  final data = Map<dynamic, dynamic>.from(
                    snapshot.data!.snapshot.value as Map,
                  );
                  List list = data.values.toList();
                  if(isObscure.length!=list.length){
                    isObscure=List.filled(list.length, false);
                  }
                  return SizedBox(
                    height: 300,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        mainAxisExtent: 55,
                        crossAxisSpacing: 9.0,
                        mainAxisSpacing: 9.0,
                      ),
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12,
                          ),

                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(list[index]["name"] ?? ""),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          scrollable: true,
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  child: imageUrl != null
                                                      ? Image.network(
                                                    imageUrl!,
                                                    fit: BoxFit.cover,
                                                  )
                                                      : image != null
                                                      ? Image.file(
                                                    image!.absolute,
                                                    fit: BoxFit.cover,
                                                  )
                                                      : Image.network(
                                                    list[index]["image"] ??
                                                        " ",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () async {
                                                  String? id=list[index]["id"];
                                                  imageFromGallery();
                                                  await uploadImage();
                                                    dataReference.child(id!)
                                                        .update({
                                                      "image": imageUrl,
                                                    })
                                                        .then((value) {
                                                      Utils().toastMessage(
                                                        "UpdateSuccessfully",
                                                      );
                                                    })
                                                        .onError((
                                                        error,
                                                        stackTrace,
                                                        ) {
                                                      Utils().toastMessage(
                                                        error.toString(),
                                                      );
                                                    });

                                                },
                                                icon: Icon(Icons.edit),
                                              ),
                                            ],
                                          ),
                                          content: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(list[index]["name"] ?? ""),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () =>
                                                        _showDialogBox0(list[index]["id"],list[index]["name"]),
                                                    icon: Icon(Icons.edit),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      list[index]["description"],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () =>
                                                        _showDialogBox3(list[index]["id"],list[index]["description"]),
                                                    icon: Icon(Icons.edit),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      list[index]["price"],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () =>
                                                        _showDialogBox4(list[index]["id"],list[index]["price"]),
                                                    icon: Icon(Icons.edit),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      list[index]["visibility"]=!(list[index]["visibility"]);
                                      dataReference.child(list[index]["id"]).update({
                                        "visibility": list[index]["visibility"],
                                      });

                                    });
                                  },
                                  icon: list[index]["visibility"]
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
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
  Future<void> _showDialogBox0(String id,String title) async {
    nameUpdateController.text=title;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update the name of menu"),
          content: TextFormField(
            controller: nameUpdateController,
            decoration: InputDecoration(
              hintText: "Update the name of manu from here",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async{

                await dataReference.child(id)
                    .update({"name": nameUpdateController.text.toLowerCase()})
                    .then((value) {
                  Utils().toastMessage("UpdateSuccessfully");
                })
                    .onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });

                Navigator.pop(context);
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogBox3(String id,String desc) async {
    descUpdateController.text=desc;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update the description of menu"),
          content: TextFormField(
            controller: descUpdateController,
            decoration: InputDecoration(
              hintText: "Update the desc of manu from here",
            ),
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
                dataReference.once().then((snapshot) async {
                  final data1 = snapshot.snapshot.value as Map?;
                  if (data1 != null || data1!.isNotEmpty) {
                    await dataReference
                        .child(id)
                        .update({"description": descUpdateController.text})
                        .then((value) {
                      Utils().toastMessage("UpdateSuccessfully");
                    })
                        .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  }
                });
                Navigator.pop(context);
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogBox4(String id,String price) async {
    priceUpdateController.text=price;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update the price of menu"),
          content: TextFormField(
            controller: priceUpdateController,
            decoration: InputDecoration(
              hintText: "Update the price of manu from here",
            ),
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
                dataReference.once().then((snapshot) async {
                  final data1 = snapshot.snapshot.value as Map?;
                  if (data1 != null || data1!.isNotEmpty) {
                    await dataReference
                        .child(id)
                        .update({"price": priceUpdateController.text})
                        .then((value) {
                      Utils().toastMessage("UpdateSuccessfully");
                    })
                        .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  }
                });
                Navigator.pop(context);
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
