import "package:flutter/material.dart";

import "../../modules/login/login_screen.dart";
import "../network/local/cashe_helper.dart";

const defaultColorLight = Color(0xff0f5ef5);
const defaultColorDark = Colors.blue;


dynamic uId = '';

void SignOut(context) {
  CacheHelper.removeData(key: "token").then((value) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  });
}
