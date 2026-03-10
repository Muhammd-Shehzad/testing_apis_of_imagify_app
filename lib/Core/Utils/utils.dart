import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChnage(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flashBarErrorMesage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.BOTTOM,
        isDismissible: true,
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.symmetric(vertical: 30),
        icon: const Icon(Icons.error_outline, color: Colors.white, size: 28.0),
      )..show(context),
    );
  }
}
