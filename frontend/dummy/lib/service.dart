// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';

// Logger logger = Logger();

// class Service {
//   //Creating the method to save user
//   Future<void> saveUser(String username, String email, String password) async {
//     Logger().i("ENTER IN SERVICE AND saveUser method");
//     // //create url
//     // var uri = Uri.parse("http://localhost:8080/register");

//     // //header
//     // Map<String, String> headers = {"Content-Type": "application/json"};
//     // //body
//     // Map data = {
//     //   'username': username,
//     //   'email': email,
//     //   'password': password,
//     // };
//     // //conver the above data into json
//     // var body = json.encode(data);
//     // Logger().i(" Hello ");
//     // var response = await http.post(uri, headers: headers, body: body);

//     // //print the response body
//     // logger.i(response.body);

//     // return response;
//     try {
//       final url = Uri.parse("http://localhost:8080/register");
//       var dict = {
//         'username': username,
//         'email': email,
//         'password': password,
//       };

//       final response = await http.post(url, body: json.encode(dict));

//       if (response.statusCode == 200) {
//         logger.i("Data sent successfully");
//       } else {
//         logger.i("data not set");
//       }
//     } catch (error) {
//       logger.e("Catch Error: $error");
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Logger logger = Logger();

class Service {
  // Creating the method to save user
  Future<bool> saveUser(String username, String email, String password) async {
    logger.i("ENTER IN SERVICE AND saveUser method");

    try {
      final url = Uri.parse("http://10.0.2.2:8080/register");
      var data = {
        'username': username,
        'email': email,
        'password': password,
      };

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        bool isUnique = jsonDecode(response.body);
        if (isUnique) {
          logger.i("Data stored in mysql successfully");
        } else {
          logger.i("username or email is registered");
        }
        return isUnique;
      } else {
        logger.e("Failed to send data. Status code: ${response.statusCode}");
        return false;
      }
    } catch (error) {
      logger.e("Catch Error: $error");
      return false;
    }
  }
}
