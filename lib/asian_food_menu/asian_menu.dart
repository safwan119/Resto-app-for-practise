import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

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
        toolbarHeight: 90,
        title: Column(
          children: [
            Text("Mc Donald's - Seri Austin DT", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        return FoodMenuClass(food: FilterMenuFood3[index],);
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
        onPressed: () {},
        child: Center(child: Text(title!)),
      ),
    );
  }
}
