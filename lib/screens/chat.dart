import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import '../models/message-model.dart';
import '../widgets/custom-bubble.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ChatPage extends StatelessWidget {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMesagesCollections);
  TextEditingController controller = TextEditingController();
  // const ChatPage({super.key});
  static String id = 'ChatPage';

  final  _controller = ScrollController();

// This is what you're looking for!

  


  @override
  Widget build(BuildContext context) {
   // Material.of(context).
 var email=  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>
    
    (stream: messages.orderBy('createdAt',descending: true).snapshots(),
    
     builder: (context, snapshot) {
      
        if(snapshot.hasData){
         List<MessageModel> messagesList=[];
        for (var i = 0; i < snapshot.data!.docs.length; i++) {
          messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
        }
          return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              klogo,
              height: 45,
              width: 45,
            ),
            const Text(
              'chat',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        // centerTitle: true,
      ),
    //  floatingActionButton: FloatingActionButton.small(
    //   onPressed: _scrollDown,
    //   child: Icon(Icons.arrow_downward),
    // ),
      // ignore: prefer_const_constructors
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            controller: _controller,
            itemCount: messagesList.length,
            itemBuilder: (context, index) {
              return messagesList[index].id == email? CustomtBubble(
                message: messagesList[index],
              ): CustomtBubbleForFriend(message: messagesList[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onSubmitted: (data) {
              messages.add({
                'messages': data,
                'createdAt' : DateTime.now(),
                'id' : email
              });
              controller.clear();
              _controller.animateTo(
                0,
              //_controller.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
  );

            },
            decoration: InputDecoration(
              hintText: 'Send Message',
              suffixIcon: const Icon(
                Icons.send,
                color: kPrimaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: kPrimaryColor)),
              // focusColor: kPrimaryColor
            ),
          ),
        ),
      ]),
    );
        }
        else{
          return Text("Loading.......");
        }
     },);
  }
}
