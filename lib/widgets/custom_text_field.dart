import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.hint, this.onchanged,this.obscureText=false});
  String? hint;
 Function(String)? onchanged;
 bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      obscureText: obscureText!,
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if(value!.isEmpty){
           return "field required!!!!!!";
        }
       // return null;
      },
      // ignore: body_might_complete_normally_nullable
        onChanged: onchanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white)
            ),
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(16),
             
            )
          ),
        );
  }
}