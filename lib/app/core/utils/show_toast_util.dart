import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibration/vibration.dart';

class ShowToastUtil {
  static warning(String message) {
    Vibration.vibrate();

    return Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor: Colors.orangeAccent,
    );
  }

  static error(String message) {
    Vibration.vibrate();

    return Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  static success(String message) {
    Vibration.vibrate();

    return Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor: Colors.green,
    );
  }
}
