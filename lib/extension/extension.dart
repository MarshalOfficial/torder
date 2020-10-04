import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Extension {
  static bool isApiCallResultSucceed(List<dynamic> lst) {
    bool result = true;
    if (lst == null) {
      Fluttertoast.showToast(
          msg: "انتقال اطلاعات با خطا مواجه شد",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      result = false;
    } else if (lst[0]["Result"] != null &&
        lst[0]["Result"].toString().toLowerCase().contains("error")) {
      Fluttertoast.showToast(
          msg: lst[0]["Txt"].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      result = false;
    }
    return result;
  }

  static void showErrorToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
