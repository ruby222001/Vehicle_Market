
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:project/models/popup_menu.dart';
import 'package:project/services/user.dart';

loadingDialogBox(BuildContext context, String loadingMessage) {
  AlertDialog alert = AlertDialog(
    content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularProgressIndicator(
            color: Colors.pink,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            loadingMessage,
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ]),
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

customSnackBar({required BuildContext context, required String content}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Colors.white, letterSpacing: 0.5),
    ),
  ));
}

Widget roundedButton({
  context,
  required Color? bgColor,
  required Function()? onPressed,
  Color? textColor,
  double? width,
  double? heightPadding,
  required String? text,
  Color? borderColor,
}) {
  return SizedBox(
    width: width ?? double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: borderColor ?? Colors.pink,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(bgColor)),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: heightPadding ?? 15),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}

wrongDetailsAlertBox(String text, BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Text(
      text,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Ok',
          )),
    ],
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

openBottomSheet(
    {required BuildContext context,
    required Widget child,
    String? appBarTitle,
    double? height}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        primary: Colors.white,
                      ),
                      child: Icon(Icons.close, color: Colors.black),
                    ),
                  ),
                ],
              ),
              appBarTitle != null
                  ? Container(
                      color: Colors.transparent,
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.pink,
                        title: Text(
                          appBarTitle,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight:
                            height ?? MediaQuery.of(context).size.height / 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: child,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

customPopUpMenu({
  required BuildContext context,
  required String? chatroomId,
}) {
  CustomPopupMenuController controller = CustomPopupMenuController();
  UserService firebaseUser = UserService();
  List<PopUpMenuModel> menuItems = [
    PopUpMenuModel('Delete', Icons.delete),
    PopUpMenuModel('Mark Sold', Icons.done),
  ];
  return CustomPopupMenu(
    menuBuilder: () => ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.white,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: menuItems
                .map(
                  (item) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (menuItems.indexOf(item) == 0) {
                        firebaseUser.deleteChat(chatroomId: chatroomId);
                        customSnackBar(
                            context: context,
                            content: 'Chat successfully deleted..');
                      } else {
                        print('Mark Sold');
                      }
                      controller.hideMenu();
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            item.icon,
                            size: 15,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ),
    pressType: PressType.singleClick,
    verticalMargin: -10,
    controller: controller,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Icon(Icons.more_vert_sharp, color: Colors.black),
    ),
  );
}