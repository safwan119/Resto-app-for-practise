import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/book_table.dart';
import 'package:my_first_proj/filter_menu/filter_menu_category.dart';
import 'package:my_first_proj/review.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';
import 'drawer/drawer.dart';

class PromotionHours {
  final String day;
  final String openTime;
  final String closeTime;
  final String discountPercentage;

  PromotionHours(this.day, this.openTime, this.closeTime, this.discountPercentage);
}

class RestaurantFoodMenu extends StatefulWidget {
  const RestaurantFoodMenu({super.key});

  @override
  State<RestaurantFoodMenu> createState() => _RestaurantFoodMenuState();
}

class _RestaurantFoodMenuState extends State<RestaurantFoodMenu> {
  List<bool> isSelected = [];
  List<bool> isSelected1 = [];
  int? selectedIndex;
  final databaseReference = FirebaseDatabase.instance.ref("Restaurant Detail");
  final realtimeDatabaseRef = FirebaseDatabase.instance.ref(
    "Restaurant Category",
  );
  final dataReference = FirebaseDatabase.instance.ref("Menu item");
  final realtimeDatabaseReference = FirebaseDatabase.instance.ref("Option2");
  final dataBReference = FirebaseDatabase.instance.ref("Option1");
  final realtimeDatabaseRefer = FirebaseDatabase.instance.ref(
    "Operation Promotion Hours",
  );
  var search = TextEditingController();
  List<dynamic> originalList = [];
  List<dynamic> filteredList = [];
  bool _initialized = false;
  List<dynamic> filteredByCategory = [];
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    promotionalList();
    isWithPromotionalHours();
  }

  List<PromotionHours> promotionHours = [];

  Future<void> promotionalList() async {
    final promotionalSnapshot = await realtimeDatabaseRefer.once();
    final promotionalData = promotionalSnapshot.snapshot.value as Map?;
    if (promotionalData != null && promotionalData.isNotEmpty) {
      promotionHours = [
        PromotionHours(
          'Sunday',
          promotionalData["sunOpenOff"],
          promotionalData["sunCloseOff"],
          promotionalData["sunOff"],
        ),
        PromotionHours(
          'Monday',
          promotionalData["monOpenOff"],
          promotionalData["monCloseOff"],
          promotionalData["monOff"],
        ),
        PromotionHours(
          "Tuesday",
          promotionalData["tueOpenOff"],
          promotionalData["tueCloseOff"],
          promotionalData["tueOff"],
        ),
      ];
    }
  }

  bool isWithPromotionalHours() {
    final now = DateTime.now();
    final currentDay = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ][now.weekday];
    final currentTime =
        "${now.hour.toString().padLeft(2, "0")}:${now.minute.toString().padLeft(2, "0")}";
    for (var promo in promotionHours) {
      if (promo.day == currentDay) {
        if (currentTime.compareTo(promo.openTime) >= 0 &&
            currentTime.compareTo(promo.closeTime) <= 0) {
          return true;
        }
      }
    }
    return false;
  }
  double applyDiscount(double price) {
    if (!isWithPromotionalHours()) return price;

    final now = DateTime.now();
    final currentDay = [
      "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday",
    ][now.weekday];

    final promo = promotionHours.firstWhere(
          (p) => p.day == currentDay,
    );

    if (promo != null && promo.discountPercentage != null && promo.discountPercentage.isNotEmpty) {
      final discountPercent = double.tryParse(promo.discountPercentage.replaceAll('% OFF', ''));
      if (discountPercent != null) {
        return price * (1 - discountPercent / 100);
      }
    }

    return price;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredList = originalList.where((restaurant) {
        return restaurant["name"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
                Expanded(
                  child: Text(
                    "Mcdonald's-Seri Austin DT",
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  controller: search,
                  onChanged: (value) => filterSearchResults(value),
                  decoration: InputDecoration(
                    hintText: "Search for food",
                    prefixIcon: Icon(Icons.search, size: 20),
                    border: InputBorder.none,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterChips()),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data is available"));
          }
          final data = Map<String, dynamic>.from(
            snapshot.data!.snapshot.value as Map,
          );
          final firstKey = data.values.first;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.network(
                          firstKey["image"] ??
                              "https://example.com/placeholder.png",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image: $error');
                            return Center(
                              child: Text(
                                'Image not available',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,

                      left: 10,
                      right: 10,
                      child: Card(
                        elevation: 8,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                    ),
                                    child: Text(
                                      firstKey["Name"] ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookTable(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Divider(color: Colors.black),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text("4.9"),
                                  SizedBox(width: 8),
                                  Text(
                                    "View Ratings and Reviews",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReviewProducts(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Divider(color: Colors.black),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Icon(
                                      Icons.directions_walk,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text("3km away"),
                                  SizedBox(width: 8),
                                  Text(
                                    "(Pick up in 15 mins)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Colors.black),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: "Complete your reservation detail"),
                      TextSpan(
                        text: "(Required)",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TimeDateCard(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(Icons.not_interested_rounded, color: Colors.black),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "At the moment there is no availability for today. The next availability for 3 guests is tomorrow",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        firstKey["image1"] ?? " ",
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                StreamBuilder(
                  stream: realtimeDatabaseRef.onValue,
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
                    final data2 = snapshot.data!.snapshot.value as Map;
                    List list1 = data2.values.toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: list1.length,
                          itemBuilder: (context, index) {
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = index;
                                  selectedCategory = list1[index]["category"];
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: selectedIndex == index
                                    ? Colors.amberAccent
                                    : Colors.black12,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              child: Center(
                                child: Text(list1[index]["category"]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      StreamBuilder(
                        stream: dataReference.onValue,
                        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.snapshot.children.isEmpty) {
                            return Center(child: Text("No data available"));
                          }
                          // final map1=snapshot.data!.snapshot.value as Map?;
                          // final firstKey1=map1!.values.first;
                          if (snapshot.hasData && !_initialized) {
                            final map = snapshot.data!.snapshot.value as Map;
                            originalList = map.values.toList();
                            filteredList = List.from(originalList);
                            _initialized = true;
                          }
                          if (selectedIndex != null) {
                            filteredList = originalList
                                .where(
                                  (element) => element["category"].contains(
                                    selectedCategory,
                                  ),
                                )
                                .toList();
                          } else {
                            filteredList = List.from(originalList);
                          }
                          return filteredList.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: GridView.builder(
                                    itemCount: filteredList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 250,
                                          mainAxisExtent: 280,
                                          childAspectRatio: 0.75,
                                          crossAxisSpacing: 11.0,
                                          mainAxisSpacing: 11.0,
                                        ),
                                    itemBuilder: (context, index) {
                                      var priceValue = filteredList[index]["price"];
                                      double price = double.tryParse(priceValue.toString()) ?? 0.0;
                                      final discounted = applyDiscount(price);
                                      print("Discounted:${discounted}");
                                      return InkWell(
                                        onTap: () async {
                                          return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                scrollable: true,
                                                title: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        child: Image.network(
                                                          filteredList[index]["image"],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      top: 0,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              8.0,
                                                            ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: IconButton(
                                                            style: IconButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.white,

                                                              shape:
                                                                  CircleBorder(),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            icon: Icon(
                                                              Icons.close,
                                                              size: 20,
                                                              grade: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        filteredList[index]["name"] ??
                                                            " ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      trailing:
                                                      isWithPromotionalHours()?Text(
                                                        "RM ${discounted}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ):
                                                      Text(
                                                        "RM ${filteredList[index]["price"] ?? " "}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                          ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "A specialty of the Malaysian Island of penang.the soup is made with mackerel and authentic taste.",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                          ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          filteredList[index]["title1"] ??
                                                              " ",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    StreamBuilder(
                                                      stream: dataBReference
                                                          .onValue,
                                                      builder:
                                                          (
                                                            context,
                                                            AsyncSnapshot<
                                                              DatabaseEvent
                                                            >
                                                            snapshot,
                                                          ) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return Center(
                                                                child: CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      4,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              );
                                                            }
                                                            if (!snapshot
                                                                    .hasData ||
                                                                snapshot
                                                                    .data!
                                                                    .snapshot
                                                                    .children
                                                                    .isEmpty) {
                                                              return Center(
                                                                child: Text(
                                                                  "No data available",
                                                                ),
                                                              );
                                                            }
                                                            final data2 =
                                                                snapshot
                                                                        .data!
                                                                        .snapshot
                                                                        .value
                                                                    as Map;
                                                            List list2 = data2
                                                                .values
                                                                .toList();

                                                            if (isSelected1
                                                                    .length !=
                                                                list2.length) {
                                                              isSelected1 =
                                                                  List.filled(
                                                                    list2
                                                                        .length,
                                                                    false,
                                                                  );
                                                            }
                                                            return SizedBox(
                                                              width: double
                                                                  .maxFinite,
                                                              // allows full width
                                                              height: 170,
                                                              child: ListView.builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: list2
                                                                    .length,
                                                                itemBuilder: (context, index) {
                                                                  return CheckboxListTile(
                                                                    title: Text(
                                                                      list2[index]["option1"] ??
                                                                          "",
                                                                    ),
                                                                    activeColor:
                                                                        Colors
                                                                            .amber,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    value:
                                                                        isSelected1[index],
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        isSelected1[index] =
                                                                            !isSelected1[index];
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                          ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          filteredList[index]["title2"] ??
                                                              " ",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    StreamBuilder(
                                                      stream:
                                                          realtimeDatabaseReference
                                                              .onValue,
                                                      builder:
                                                          (
                                                            context,
                                                            AsyncSnapshot<
                                                              DatabaseEvent
                                                            >
                                                            snapshot,
                                                          ) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return Center(
                                                                child: CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      4,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              );
                                                            }
                                                            if (!snapshot
                                                                    .hasData ||
                                                                snapshot
                                                                    .data!
                                                                    .snapshot
                                                                    .children
                                                                    .isEmpty) {
                                                              return Center(
                                                                child: Text(
                                                                  "No data available",
                                                                ),
                                                              );
                                                            }
                                                            final data2 =
                                                                snapshot
                                                                        .data!
                                                                        .snapshot
                                                                        .value
                                                                    as Map;
                                                            List list2 = data2
                                                                .values
                                                                .toList();
                                                            print(
                                                              "The objects:${list2[index]["option1"]}",
                                                            );
                                                            if (isSelected
                                                                    .length !=
                                                                list2.length) {
                                                              isSelected =
                                                                  List.filled(
                                                                    list2
                                                                        .length,
                                                                    false,
                                                                  );
                                                            }
                                                            return SizedBox(
                                                              width: double
                                                                  .maxFinite,
                                                              // allows full width
                                                              height: 170,
                                                              child: ListView.builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: list2
                                                                    .length,
                                                                itemBuilder: (context, index) {
                                                                  return CheckboxListTile(
                                                                    title: Text(
                                                                      list2[index]["option2"] ??
                                                                          "",
                                                                    ),
                                                                    activeColor:
                                                                        Colors
                                                                            .amber,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    value:
                                                                        isSelected[index],
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        isSelected[index] =
                                                                            !isSelected[index];
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                    ),

                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                          ),
                                                      child: Card(
                                                        elevation: 6,
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        12,
                                                                      ),
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                            child: Center(
                                                              child: Text(
                                                                "Add to Card",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Visibility(
                                          key: ValueKey(
                                            filteredList[index]['id'],
                                          ),
                                          visible:
                                              filteredList[index]["visibility"],
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            elevation: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    child: Image.network(
                                                      filteredList[index]["image"] ??
                                                          " ",
                                                      fit: BoxFit.cover,
                                                      height: 120,
                                                      width: double.infinity,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        filteredList[index]["name"] ??
                                                            " ",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        filteredList[index]["description"] ??
                                                            " ",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 12,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(height: 15),
                                                      Row(
                                                        children: [
                                                          isWithPromotionalHours()?Text(
                                                            "RM ${discounted}",
                                                            style: TextStyle(
                                                              color: Colors.orange,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                            ),
                                                          ):Text(
                                                            "RM ${filteredList[index]["price"]}",
                                                            style:
                                                                const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                          ),
                                                          Spacer(),
                                                          Icon(
                                                            Icons.add_box_sharp,
                                                            color: Colors.amber,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  child: Center(child: Text("No data here")),
                                );
                        },
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: filteredList.isNotEmpty
                              ? Card(
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
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Text(
                                            "Proceed to booking",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 20,
                                          ),
                                          child: Text(
                                            "RM 49.20",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
