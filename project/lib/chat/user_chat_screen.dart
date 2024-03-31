
import 'package:project/chat/chat_stream.dart';
import 'package:project/constants/widgets.dart';
import 'package:project/services/user.dart';

import 'package:flutter/material.dart';
import 'package:project/models/product_provider.dart';
import 'package:provider/provider.dart';

class UserChatScreen extends StatefulWidget {
  static const String screenId = 'user_chat_screen';
  final String? chatroomId;
  const UserChatScreen({Key? key, this.chatroomId}) : super(key: key);

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  TextEditingController msgController = TextEditingController();
  UserService firebaseUser = UserService();

  bool send = false;

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  sendMessage() {
    if (msgController.text.isNotEmpty) {
      FocusScope.of(context).unfocus();
      Map<String, dynamic> message = {
        'message': msgController.text,
        'sent_by': firebaseUser.user!.uid,
        'time': DateTime.now().microsecondsSinceEpoch,
      };

      firebaseUser.createChat(chatroomId: widget.chatroomId, message: message);
      msgController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  _body() {
    return Container(
      child: Stack(
        children: [
          ChatStream(
            chatroomId: widget.chatroomId,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              send = true;
                            });
                          } else {
                            setState(() {
                              send = false;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          /// Pressing Enter and Sending Message Case
                          if (value.length > 0) {
                            sendMessage();
                          }
                        },
                        controller: msgController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter you message...',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_file),
                    ),
                    Visibility(
                      visible: send,
                      child: IconButton(
                        onPressed: sendMessage,
                        icon: Icon(Icons.send),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Chat Details',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            customPopUpMenu(
              context: context,
              chatroomId: widget.chatroomId,
            ),
          ],
        ),
        body: _body());
  }
}