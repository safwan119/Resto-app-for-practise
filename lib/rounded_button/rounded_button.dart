import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget{
  final String title;
  final VoidCallback? ontap;
  final bool loading;
  RoundedButton({required this.title,required this.ontap,this.loading=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),

        ),
        child: Center(child: loading?CircularProgressIndicator(strokeWidth: 4,color: Colors.white,):Text(title)),
      ),
    );
  }

}