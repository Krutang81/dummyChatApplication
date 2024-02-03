import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() {
    return _ForgetPasswordState();
  }
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Forget Password'),
        leading: const BackButton(),),
        body: const Center(
          child: Text('Forget Password'),
        )
      ),
    );
  }
}
