import 'package:dummy/format.dart';
import 'package:dummy/login_page.dart';
import 'package:dummy/otp_page.dart';
import 'package:dummy/service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Future<void> validateAndOtpPage(Format data, BuildContext context) async {
  // Validation
  // If user exist
  // if password correct
  // go to otp page

  logger.i(data.username);
  logger.i(data.password);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const OtpPage()));
}

Future<void> newUser(
    {required Format data, required BuildContext context}) async {
  //Check unique Username
  //Check password and confirm password are same
  //Data will be stored in the MySql
  Service service = Service();
  service.saveUser(data.username, data.email, data.password);
  //Now go to the login page

  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Login()));
}
