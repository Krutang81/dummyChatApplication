import 'package:dummy/home_page.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  EmailOTP myAuth = EmailOTP();
  var template = '''
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title>Email OTP Code</title>
      <style>
        body {
          background-color: #f0f8ff;
          font-family: Arial, sans-serif;
        }

        .otp-container {
          text-align: center;
          padding: 20px;
          background-color: #007bff;
          color: #ffffff;
          border-radius: 10px;
          margin: 20px;
        }
      </style>
    </head>
    <body>
      <div class="otp-container">
        Your OTP is {{otp}}.
      </div>
    </body>
  </html>
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: userEmailController,
                decoration: const InputDecoration(hintText: "User Email"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                myAuth.setConfig(
                  appEmail: "kashmirapatel2004@gmail.com",
                  appName: "Email OTP",
                  userEmail: userEmailController.text,
                  otpLength: 6,
                  otpType: OTPType.digitsOnly,
                );

                myAuth.setSMTP(
                  host: "smtp.gmail.com",
                  auth: true,
                  username: "kashmirapatel2004@gmail.com",
                  password: "pdmh oxzu jcvo spmi",
                  secure: "TLS",
                  port: 587,
                );
                myAuth.setTheme(theme: "v1");

                if (await myAuth.sendOTP() == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("OTP has been sent"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Oops, OTP send failed"),
                    ),
                  );
                }
              },
              child: const Text("Send OTP"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: otpController,
                decoration: const InputDecoration(hintText: "Enter OTP"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (await myAuth.verifyOTP(otp: otpController.text) == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("OTP is verified"),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid OTP"),
                    ),
                  );
                }
              },
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
