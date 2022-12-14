import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API_Response/login_response.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Screens/home_screen.dart';
import 'package:marketapp/Screens/login_screen.dart';

dynamic tokenapistatus;
dynamic bearertoken;
dynamic loginstatus;
dynamic customerrole;
dynamic customername;
dynamic custfullname;

// For Profile View
dynamic Firstname;
dynamic Lastname;
dynamic Emailid;

class Tokenapi {
// token fucntion
  tokenfunct(context, username, password) async {
    try {
      var headers = {
        'Authorization':
            'Basic ZHVrYW4tYXBwLmNsaWVudC5lNDhiZmNlOWIwNDc0NTlhODhlY2M0MmRhZWRkNTNlMzpRd2VydHlAMTIz'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              '${baseurl}/oauth/token?grant_type=password&username=${username.toString()}&password=${password.toString()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      tokenapistatus = response.statusCode;
      // print("Status Code: ${tokenapistatus}");
      var data = jsonDecode(await response.stream.bytesToString());
      bearertoken = data["access_token"];
      print(bearertoken);
      switch (tokenapistatus) {
        // 200 status excution
        case 200:
          Future.delayed(const Duration(milliseconds: 1200), () async {
            var headers = {
              'loginType': 'BROAN',
              'Authorization': 'Bearer $bearertoken',
              'Content-Type': 'application/json',
            };
            // print(headers);
            var request =
                http.Request('POST', Uri.parse('${baseurl}/user/login'));
            request.body = json.encode("");
            request.headers.addAll(headers);

            http.StreamedResponse response = await request.send();
            var logindata = jsonDecode(await response.stream.bytesToString());
            // print(response.statusCode);
            customerrole = logindata["role"]["role"];
            custfullname = logindata["firstName"];
            customername = logindata["firstName"][0];

            //For profile
            Firstname = logindata['firstName'];
            Lastname = logindata['lastName'];
            Emailid = logindata['emailId'];

            if (response.statusCode == 200) {
              // print(customerrole);
              Navigator.of(context).pushReplacementNamed("/Homescreen");
              // Navigator.of(context).pushReplacement(
              //   PageRouteBuilder(
              //     pageBuilder: (context, animation, secondaryAnimation) =>
              //         Homescreen(),
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       var begin = const Offset(0.0, 1.0);
              //       var end = Offset.zero;
              //       var curve = Curves.easeInBack;
              //
              //       var tween = Tween(begin: begin, end: end)
              //           .chain(CurveTween(curve: curve));
              //
              //       return SlideTransition(
              //         position: animation.drive(tween),
              //         child: child,
              //       );
              //     },
              //   ),
              // );
              Flushbar(
                flushbarPosition: FlushbarPosition.BOTTOM,
                flushbarStyle: FlushbarStyle.FLOATING,
                backgroundColor: Colors.blueGrey,
                reverseAnimationCurve: Curves.decelerate,
                forwardAnimationCurve: Curves.decelerate,
                message: 'Successfully Login',
                duration: Duration(seconds: 3),
              ).show(context);
              // Loginresponse().loginrole(context);
            }
          });
          break;

        case 400:
          break;

        case 500:
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Authentication Error"),
              content: const Text("Check Username and Password"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
          break;

        default:
        // print("Default Case Execute");
        // showDialog(
        //   context: context,
        //   builder: (ctx) => AlertDialog(
        //     title: const Text("Authentication Error"),
        //     content: const Text("Check Internet Connection"),
        //     actions: <Widget>[
        //       TextButton(
        //         onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        //         child: const Text("Retry"),
        //       ),
        //     ],
        //   ),
        // );
      }
    } catch (e) {
      print("Server Down");
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Authentication Error"),
          content: const Text("Check Internet Connection"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Retry"),
              ),
            ),
          ],
        ),
      );
    }
  }
}
