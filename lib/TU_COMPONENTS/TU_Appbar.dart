import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/TU_UTILS/TU_Colors.dart';
import 'package:firebase_signin/TU_UTILS/TU_Text.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  var onPressed;

  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: ' TECHIE ', size: 30, color: AppColors.primary),
              modifiedText(text: 'INFO        ', size: 30, color: AppColors.lightwhite),
              ElevatedButton(
                child: Text("LOGOUT"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  });
                },
              ),
            ],
          )),
      centerTitle: true,
    );
  }
}
