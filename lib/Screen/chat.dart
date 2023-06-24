import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../models/massages.dart';
import '../utils/chat_buble.dart';

class ChatPage extends StatelessWidget {

  final _controller = ScrollController();
  static String id = 'ChatPage';

  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    var email  = ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            body:Stack(
              children: [
                Image.asset("images/login.png",width: double.infinity,fit: BoxFit.fitWidth),

                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return messagesList[index].id == email ?  ChatBuble(
                              message: messagesList[index],
                            ) : ChatBubleForFriend(message: messagesList[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add(
                            {kMessage: data, kCreatedAt: DateTime.now(), 'id' : email },

                          );
                          controller.clear();
                          _controller.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: const Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          );
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}