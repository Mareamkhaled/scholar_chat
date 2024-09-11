// // ignore: file_names
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../constants.dart';

// class SendMsg extends StatelessWidget {
//   CollectionReference messages = FirebaseFirestore.instance.collection('messages');
//   //  SendMsg({
//   //   super.key,
//   // });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: TextField(
//         onSubmitted: (data) {
//           messages.add({
//             'messages' :data
//           });
//         },
//         decoration: InputDecoration(
//           hintText: 'Send Message',
//           suffixIcon: const Icon(Icons.send,
//           color: kPrimaryColor,),
//           border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//              ),
//           enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(
//               color: kPrimaryColor
//             )
        
//           ),
//          // focusColor: kPrimaryColor
          
//         ),
//       ),
//     );
//   }
// }
