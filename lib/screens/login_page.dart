// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snakbar.dart';
import '../main.dart';
import 'chat.dart';
import 'signup_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
   // ignore: use_super_parameters
   const LoginPage({Key? key}) : super(key: key);
static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 GlobalKey <FormState> formkey = GlobalKey();

 String? email , password;

 bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
          backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
               const  SizedBox(
                      height: 75,
                    ),
               const Image(image: AssetImage(klogo),height: 100,),
              const SizedBox(height: 40,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Scholar Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: "Pacifico"
                    ),
                    ),
                  ],
                ),
            const SizedBox(height: 40,),
            
               const Row(
                 children: [
                   Text("LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                     // fontFamily: "Pacifico"
                    ),
                    ),
                 ],
               ),
               const SizedBox(height: 10,),
                 CustomTextField(
                  hint: "Email",
                 onchanged:(data) {
                      email = data;
                    },
                
                 ),
                const SizedBox(height: 20,),
                 CustomTextField(
                  obscureText: true,
                  hint: "Password",
                  onchanged: (data) {
                      password = data;
                    },
                ),
                const SizedBox(height: 20,),
                CustomButton(
                  ontap: () async{
                     if (formkey.currentState!.validate()) {
                      isloading = true;
                       setState(() {
                          
                        });
                        try {
                          // ignore: unused_local_variable
                          UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!
        );         // showSnakBar(context, "success");
                    Navigator.of(context).pushNamed(ChatPage.id,arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnakBar(
                                
                                context, "No user found for that email. ");
                            // print('The password provided is too weak.');
                          } else if (e.code == 'wrong-password') {
                            showSnakBar(context,
                                "Wrong password provided for that user.");
                            // print('The account already exists for that email.');
                          }
                        } catch (e) {
                          showSnakBar(context, e.toString());
                        }
                      //  showSnakBar(context, "success");
                       }
                      else {
                       // showSnakBar(context, "NULL");
                      }
                  },
                  txt: 'LOGIN'
                 
                    ),
                  
                const SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have an account?",
                   style: TextStyle(
                  color: Colors.white,)
                  
                  ),
                  const SizedBox(width: 10,),
                   GestureDetector(
                    onTap: () {
                     Navigator.pushNamed(context, SignupPage.id);
                    },
                     child: const Text("Sign Up",
                     style: TextStyle(
                                 color: Color(0xffC7EDE6))
                                 
                                 ),
                   ),
                ],
               )
              //,const Spacer(flex: 3,)
              ],
            ),
          ),
        ),  
          
        ),
    );
    
  }
}


 