import 'package:flutter/material.dart';
class BottomNavigatorBar1 extends StatefulWidget {
  const BottomNavigatorBar1({super.key});

  @override
  State<BottomNavigatorBar1> createState() => _BottomNavigatorBar1State();
}

class _BottomNavigatorBar1State extends State<BottomNavigatorBar1> {
  @override
  var itemIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,

      onTap: (index) {
        setState(() {
          itemIndex = index;
        });
      },
      currentIndex: itemIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_activity),
          label: "Activity",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_rounded),
          label: "Finance",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),
      ],
    );
  }
}
