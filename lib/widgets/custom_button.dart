import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.txt,required this.ontap});
 final String txt;
 VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          height: 60,
          width: double.infinity,
          child: Center(
            child: Text(txt),
          ),
          
          ),
    );
  }
}
