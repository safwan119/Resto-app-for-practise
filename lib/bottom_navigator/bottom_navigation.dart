import 'package:flutter/material.dart';
import 'package:my_first_proj/addressDetail.dart';
import 'package:my_first_proj/restaurants_detail/restaurant_menu_detail.dart';
import 'package:my_first_proj/tab_bar.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<dynamic> screens=[
    RestaurantMenuDetail(),
    TabBar1(),
    RestaurantMenuDetail(),
    AdresDetail(),
    RestaurantMenuDetail(),
  ];
  var itemIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
          selectedItemColor: Colors.amber,
          type: BottomNavigationBarType.fixed,
          currentIndex: itemIndex,
          onTap: (index){
        setState(() {
          itemIndex=index;
        });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
        BottomNavigationBarItem(icon: Icon(Icons.local_activity,), label: "Activity"),
        BottomNavigationBarItem(icon: Icon(Icons.monetization_on_rounded), label: "Finance"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
      ]),
      body: screens[itemIndex],
    );
  }
}
