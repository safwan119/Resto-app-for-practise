import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
class FoodMenu3 {
  double? price;
  String? title;
  String? description;
  String? imagePath;

  FoodMenu3(
      {required this.price, required this.title, required this.description, required this.imagePath});
}

class SearchPicture extends StatefulWidget{
  @override
  State<SearchPicture> createState() => _SearchPictureState();
}

class _SearchPictureState extends State<SearchPicture> {
  var Search=TextEditingController();
  var itemIndex=0;
  String srch="";
  List<Map<String, dynamic>> FoodList = [
    {"title": "Asian"},
    {"title": "Western"},
    {"title": "Non-Halal"},
    {"title": "Vegetarian"},
    {"title": "Thailand"},
    {"title": "Chinese"},
  ];
  List<FoodMenu3> FoodList3 = [
    FoodMenu3(price: 17.00,
        title: "Laksa Johor",
        description: "A specialty of the Malaysian Island of Penang.",
        imagePath: "assets/image/picture.jpg"),
  ];
  List<FoodMenu3> FilterMenuFood4 = [];

  void initState() {
    super.initState();
    FilterMenuFood4 = List.from(FoodList3);
  }

  void FilterSearch() {
    setState(() {
      FilterMenuFood4 = srch.isEmpty
          ? List.from(FoodList3)
          : FoodList3.where(
            (item) =>
            item.toString().toLowerCase().contains(
              srch.toLowerCase(),
            ),
      ).toList();
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
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
                Column(
                  children: [
                    Text(
                      "Mcdonald's-Seri Austin DT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: Search,
                  onChanged: (String value) {
                    srch = value;
                    FilterSearch();
                  },
                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 13,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: Image.asset("assets/image/picture.jpg",
                  fit: BoxFit.cover,
                  ),

                ),
              ),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: FoodList.length,
                  itemBuilder: (context, index) {
                    String title = FoodList[index]["title"];
                    Color color = index == 5 ? Colors.amber : Colors.black12;
                    return CountryFood2(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
           SizedBox(height: 12,),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FilterMenuFood4.isNotEmpty ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: FilterMenuFood4.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisExtent: 280,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 11.0,
                          mainAxisSpacing: 11.0
                      ),
                      itemBuilder: (context, index) {
                        return FoodMenuClass1(food: FilterMenuFood4[index],);
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
                                child: FilterMenuFood4.isNotEmpty ? Text(
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
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
class CountryFood2 extends StatelessWidget {
  String? title;
  Color? colors;

  CountryFood2(this.title, this.colors);

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
        onPressed: () {},
        child: Center(child: Text(title!,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}
class FoodMenuClass1 extends StatelessWidget {
  final FoodMenu3 food;

  FoodMenuClass1({required this.food});

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