import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() {
    return _OtpPageState();
  }
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const Center(
          child: Text("OTP PAGE"),
        ),
      ),
    );
  }
}
