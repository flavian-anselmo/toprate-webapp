import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:topratepppp/constant.dart';
import 'package:topratepppp/services/chat/one_chat.dart';
import 'package:topratepppp/widgets/message.dart';

late User loggedInUser;
final firestore = FirebaseFirestore.instance;
ModuleChat chat = ModuleChat();

class Discussions extends StatefulWidget {
  const Discussions({Key? key}) : super(key: key);
  static const String id = "mod_one_discussions";

  @override
  _DiscussionsState createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  final messageTextController = TextEditingController();
  late String txtmessage;
  ModuleChat chat = ModuleChat();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      EasyLoading.showError("status");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Discussion"),
          actions: [
            IconButton(
              onPressed: () {
                //close the screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessagesStream(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageTextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "type message ";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        txtmessage = value;
                      },
                      decoration: ktextFieldDEcoratiion.copyWith(
                        prefixIcon: const Icon(Icons.message),
                        labelText: "message",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //implelemnt send functionality
                      messageTextController.clear();
                      Provider.of<ModuleChat>(
                        context,
                        listen: false,
                      ).sendMessageToDb(txtmessage);
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: chat.firestoreChat
          .collection("discuss")
          .doc("b71NopwqcNrYYSDIU9Nd")
          .collection("mod1")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data()['msg'].toString();
          final messageSender = message.data()['sender'].toString();

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}