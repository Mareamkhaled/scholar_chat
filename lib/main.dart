//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/chat.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

import 'package:flutter/material.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  // This widget is the root of your application.
  @override
  // void initState() {
  //   FirebaseAuth.instance
  // .authStateChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //     print('***********************User is currently signed out!');
  //   } else {
  //     print('***********************User is signed in!');
  //   }
  // });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        SignupPage.id : (context) =>  const SignupPage(),
        ChatPage.id : (context)=>  ChatPage()
      },
     initialRoute: LoginPage.id,
    );
  }
}

