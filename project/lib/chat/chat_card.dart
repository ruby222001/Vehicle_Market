
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/chat/user_chat_screen.dart';
import 'package:project/constants/widgets.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/user.dart';

class ChatCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const ChatCard({Key? key, required this.data}) : super(key: key);

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  UserService firebaseUser = UserService();
  DocumentSnapshot? document;
  Auth authService = Auth();
  String? lastChatDate = '';
  @override
  void initState() {
    getProductDetails();
    getChatTime();

    super.initState();
  }

  getProductDetails() {
    firebaseUser
        .getProductDetails(widget.data['product']['product_id'])
        .then((value) {
      setState(() {
        document = value;
      });
    });
  }

  getChatTime() {
    var date = DateFormat.yMMMd().format(
        DateTime.fromMicrosecondsSinceEpoch(widget.data['lastChatTime']));
    var today = DateFormat.yMMMd().format(DateTime.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch));
    if (date == today) {
      setState(() {
        lastChatDate = 'Today';
      });
    } else {
      setState(() {
        lastChatDate = date.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (document == null) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.white,
        child: Stack(
          children: [
            ListTile(
              onTap: () {
                authService.messages.doc(widget.data['chatroomId']).update({
                  'read': 'true',
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => UserChatScreen(
                              chatroomId: widget.data['chatroomId'],
                            )));
              },
              leading: Image.network(
                document!['images'][0],
                width: 60,
                height: 60,
              ),
              title: Text(
                document!['title'],
                style: TextStyle(
                  fontWeight: widget.data['read'] == true
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document!['description'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.data['lastChat'] != null)
                    Text(
                      widget.data['lastChat'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                ],
              ),
              trailing: customPopUpMenu(
                context: context,
                chatroomId: widget.data['chatroomId'],
              ),
            ),
            Positioned(
              right: 20,
              child: Text(lastChatDate!),
            )
          ],
        ),
      );
    }
  }
}