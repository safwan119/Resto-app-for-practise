import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/main.dart';
import 'package:my_first_proj/searchPic.dart';
import 'package:my_first_proj/seperateImagfood.dart';

import '../forPass.dart';
import '../restaurants_detail/restaurant_menu_detail.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth=FirebaseAuth.instance;
  User? user;
  @override
  @override
  @override
  void initState() {
    super.initState();
    user = auth.currentUser;

    Future.delayed(Duration.zero, () {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RestaurantMenuDetail()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RestoApp()));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }
}
