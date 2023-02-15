import 'package:flutter/material.dart';

class Alerts {
  // static showToast(String msg, context) {
  //   return Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       //timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.grey,
  //       textColor: Colors.black,
  //       fontSize: 16.0);
  // }
  //
  // static errorToast(String msg, context) {
  //   return Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       //timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }
  //
  // static successToast(String msg, context) {
  //   return Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.SNACKBAR,
  //       //timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  static showSnackBar(String msg, context) {
    final snackBar = SnackBar(
      content: Text(msg),

      backgroundColor: Colors.black,
      showCloseIcon: true,
      width: 452,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

// static successSnackBar(String msg, context) {
//   final snackBar =
//   SnackBar(backgroundColor: Colors.green, content: Text(msg));
//   snackBarKey.currentState?.showSnackBar(snackBar);
// }
//
// static errorSnackBar(String msg, context) {
//   final snackBar = SnackBar(backgroundColor: Colors.red, content: Text(msg));
//   snackBarKey.currentState?.showSnackBar(snackBar);
// }
}
