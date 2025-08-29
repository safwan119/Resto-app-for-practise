import 'package:flutter/material.dart';
import 'package:my_first_proj/adreDeta.dart';
import 'package:my_first_proj/tabBar.dart';
import '../restaurants_detail/restaurant_menu_detail.dart';

class BottomNavigatorBar1 extends StatefulWidget {
  const BottomNavigatorBar1({super.key});

  @override
  State<BottomNavigatorBar1> createState() => _BottomNavigatorBar1State();
}

class _BottomNavigatorBar1State extends State<BottomNavigatorBar1> {
  var itemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        onTap:(index) {
            setState(() {
              itemIndex = index;
            });
            if(itemIndex==0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantMenuDetail()));
            }
            else if(itemIndex==1){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>TabBar1()));
            }
            else  if(itemIndex==3){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
            }
        },
      currentIndex: itemIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity,), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_rounded), label: "Finance"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
        ],
      );
  }
}

