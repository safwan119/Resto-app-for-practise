import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picture extends StatefulWidget {
  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset("image/Hey.png"));
  }
}
