import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

import '../searchPic.dart';

class FoodMenu {
  double? price;
  String? title;
  String? description;
  String? imagePath;

  FoodMenu(
      {required this.price, required this.title, required this.description, required this.imagePath});
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final FoodController = TextEditingController();
  String srch = "";
  String flavour="original";
  List<Map<String, dynamic>> titleList = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegetarian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<FoodMenu> FoodList = [
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
    FoodMenu(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
  ];
  List<FoodMenu> FilterMenuFood3 = [];
  void initState() {
    super.initState();
    FilterMenuFood3 = List.from(FoodList);
  }

  void FilterSearch() {
    setState(() {
      FilterMenuFood3 = srch.isEmpty
          ? List.from(FoodList)
          : FoodList.where(
            (item) =>
            item.toString().toLowerCase().contains(
              srch.toLowerCase(),
            ),
      ).toList();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_outlined)),
                Expanded(
                  child: Text("Mc Donald's - Seri Austin DT", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: FoodController,
                  onChanged: (String value) {
                    setState(() {
                      srch = value;
                      FilterSearch();
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Search for food",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                ),
              ),
            )
          ],
        ),

      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TimeDateCard(),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    String title = titleList[index]["title"];
                    Color color = index == 0 ? Colors.amber : Colors.black12;
                    return CountryFood3(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FilterMenuFood3.isNotEmpty ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: FilterMenuFood3.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisExtent: 280,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 11.0,
                          mainAxisSpacing: 11.0
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          showDialogBox(FilterMenuFood3[index]);
                        },
                            child: FoodMenuClass(food: FilterMenuFood3[index],));
                      }) : Container(
                      child: Center(child: Text("No result found"))),
                ),
                Positioned(bottom: 8,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.amber,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: FilterMenuFood3.isNotEmpty ? Text(
                                  "Proceed to booking", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),) : Container(),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("RM 49.20", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> showDialogBox(FoodMenu foodItem)async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title:Stack(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(foodItem.imagePath.toString(),fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              left: 0,
              right:0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment: Alignment.centerLeft,
                  child: IconButton(
                      style:IconButton.styleFrom(backgroundColor: Colors.white,

                          shape: CircleBorder()
                      ) ,
                      onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close,size: 20,grade: 12,)),
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(foodItem.title.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                trailing: Text("RM ${foodItem.price}",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(alignment: Alignment.centerLeft,
                    child: Text("A specialty of the Malaysian Island of penang.the soup is made with mackerel and authentic taste.")),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Flavour",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
              ),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Original"),
                  value: "original", groupValue: flavour
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Medium"),
                  value: "original", groupValue: null
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Mix(Original and Spicy only)"),
                  value: "original", groupValue: null
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Spices",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
              ),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Spicy"),
                  value: "original", groupValue: flavour
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Spicier"),
                  value: "original", groupValue: null
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Extra Spicy"),
                  value: "original", groupValue: null
                  , onChanged: (value){
                setState(() {
                  flavour=value.toString();
                });
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 6,
                  child: InkWell(onTap: (){},
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber,
                      ),
                      child: Center(child: Text("Add to Card")),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      );
    });
  }
}

class FoodMenuClass extends StatelessWidget {
  final FoodMenu food;

  FoodMenuClass({required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(12),
                child: Image.asset(food.imagePath!, fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.title!, style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 8),
                  Text(food.description!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text("RM ${food.price!}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),),
                      Spacer(),
                      Icon(Icons.add_box_sharp, color: Colors.amber,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryFood3 extends StatelessWidget {
  String? title;
  Color? colors;

  CountryFood3(this.title, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colors!,
          overlayColor: Colors.amber,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          if(title=="Chinese"){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPicture()));
          }
        },
        child: Center(child: Text(title!)),
      ),
    );
  }
}
