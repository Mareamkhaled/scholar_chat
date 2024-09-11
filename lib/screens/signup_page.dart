// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
//import '../helper/show_snakbar.dart';
import '../helper/show_snakbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String id = "RegisterPage";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? email;

  String? password;

//  //if i write    =>static String id = "registerPage"; i will write in the main.dart => SignupPage.id : (context) =>  SignupPage()
  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              // padding: EdgeInsets.only(top: 1),
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Image(
                  image: AssetImage(klogo),
                  height: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: "Pacifico"),
                    ),
                  ],
                ),
                //  const Spacer(flex: 3,),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        // fontFamily: "Pacifico"
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onchanged: (value) {
                      email = value;
                    },
                    hint: "Email"),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    onchanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    hint: "Password"),
                const SizedBox(
                  height: 20,
                ),
      
                CustomButton(
                    ontap: () async {
                      //           var auth = FirebaseAuth.instance;
                      //         if (formkey.currentState!.validate()) {
                      //          isLoading =true;
                      //           setState(() {
      
                      //           });
                      //   try {
                      //  // ignore: unused_local_variable
                      //  await registerUser(auth);
                      //  // ignore: use_build_context_synchronously
                      //   showSnakBar(context, "Success");
                      //   }
      
                      //   on FirebaseAuthException catch (ex) {
                      //          if (ex.code == 'weak-password') {
                      //          // ignore: avoid_print, use_build_context_synchronously
                      //          showSnakBar(context,"Weak Password");
                      //    } else if (ex.code == 'email-already-in-use') {
                      // // ignore: use_build_context_synchronously
                      //    showSnakBar(context, "The account already exists for that email.");
                      // //print('The account already exists for that email.');
                      //  }
                      //       }
                      //       catch(ex){
                      //         // ignore: avoid_print, use_build_context_synchronously
                      //         showSnakBar(context, "there is an error");
                      //       }
                      //       isLoading =false;
                      //       setState(() {
      
                      //       });
      
                      // }else{}
      
                      // print(usercredential.user!.displayName);
      
                      if (formkey.currentState!.validate()) {
                        isLoading=true;
                        setState(() {
                          
                        });
                        try {
                          UserCredential credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                         // showSnakBar(context, "success");
                          Navigator.of(context).pushNamed(ChatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnakBar(
                                context, "The password provided is too weak.");
                            // print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnakBar(context,
                                "The account already exists for that email.");
                            // print('The account already exists for that email.');
                          }
                        } catch (e) {
                          showSnakBar(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {
                          
                        });
                       }
                     
                    },
                    txt: 'REGISTER'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("login",
                          style: TextStyle(color: Color(0xffC7EDE6))),
                    ),
                  ],
                ),
                //  SizedBox(height: 50,)
                // ,const Spacer(flex: 3,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> registerUser(FirebaseAuth auth) async {
  //   // ignore: unused_local_variable
  //   UserCredential user =await auth.createUserWithEmailAndPassword(email: email!, password: password!);
  // }
}
