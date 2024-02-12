import 'package:dummy/format.dart';
import 'package:dummy/login_page.dart';
import 'package:dummy/otp_page.dart';
import 'package:dummy/service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
Service service = Service();

Future<void> validateAndOtpPage(Format data, BuildContext context) async {
  // Validation
  // If user exist
  // if password correct
  // go to otp page

  Future<bool> emailAndPassword =
      service.validateUser(data.username, data.password);
  if (await emailAndPassword) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpPage(),
      ),
    );
  }
  else{
    Fluttertoast.showToast(
          msg: "Username or password is incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.blue,
          // textColor: Colors.black,
          fontSize: 16.0);
  }

  // logger.i(data.username);
  // logger.i(data.password);
}

Future<void> newUser(
    {required Format data, required BuildContext context}) async {
  // if password correct
  //First we will check whether the password and confirm password are same or not because we don't need database for it
  if (data.password != data.confirmPassword) {
    logger.i("Password and confirm password mismatch");
    //Create a custom toast to tell the user that the password entered is incorrect
    Fluttertoast.showToast(
      msg: "The password entered is incorrect",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: Colors.blue,
      // textColor: Colors.black,
      fontSize: 16.0,
    );
    Fluttertoast.showToast(
      msg: "The password entered is incorrect",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: Colors.blue,
      // textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  //It means password and confirm password are same
  else {
    Future<bool> dataStore =
        service.saveUser(data.username, data.email, data.password);
    if (await dataStore) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } else {
      //Create a custom toast to tell the user that whether username or email is duplicated
      Fluttertoast.showToast(
          msg: "Username or email is duplicate",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.blue,
          // textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
