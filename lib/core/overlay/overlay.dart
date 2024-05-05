import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyOverlay {
  static MyOverlay instance = MyOverlay();

  ///bottomsheet

  void showMyBottomSheet(BuildContext context, Widget myDesign) {
    showBottomSheet(context: context, builder: (BuildContext context) => myDesign);
  }

  ///dialog
  void showMyDialog(BuildContext context, Widget myDesign) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              alignment: Alignment.center,
              child: myDesign,
            ));
  }

  ///dialog
  void showMyToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18.0);
  }

  ///toast
}
