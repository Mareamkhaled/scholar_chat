// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message-model.dart';

class CustomtBubble extends StatelessWidget {
   const CustomtBubble({
    Key? key,
    
    required this.message,
  }) :super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align
    (  //USING ALIGN WIDGET TO PREVENT CONTAINER EXPAND
      alignment: Alignment.centerLeft,
      child: Container(
       // alignment: Alignment.centerLeft, // this nessary for text // then i comment this after delete the height and the width to prevent the expand
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        // height: 65,
        // width: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(32)
          ),
          color: kPrimaryColor
        ),
        child:  Text(message.message,style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}



class CustomtBubbleForFriend extends StatelessWidget {
   const CustomtBubbleForFriend({
    Key? key,
    
    required this.message,
  }) :super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align
    (  //USING ALIGN WIDGET TO PREVENT CONTAINER EXPAND
      alignment: Alignment.centerRight,
      child: Container(
       // alignment: Alignment.centerLeft, // this nessary for text // then i comment this after delete the height and the width to prevent the expand
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        // height: 65,
        // width: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(32)
          ),
          color: Color(0xff006D84)
        ),
        child:  Text(message.message,style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}