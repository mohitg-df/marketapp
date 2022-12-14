import 'package:flutter/material.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Models/login_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Logincontroller extends ControllerMVC {
  var loginformkey = GlobalKey<FormState>();
  bool show_password = true;
  bool _isLoading = false;

  late Loginmodel loginmodel;

  Logincontroller() {
    this.loginmodel = Loginmodel() as Loginmodel;
  }

  loginsubmit(context) {
    if (loginformkey.currentState!.validate()) {
      loginformkey.currentState!.save();
      print("Username - ${loginmodel.email}");
      print("Password - ${loginmodel.pass}");

      setState(() {
        _isLoading = true;
      });
      Tokenapi().tokenfunct(context, loginmodel.email, loginmodel.pass);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Authentication Error"),
          content: const Text("Check Username and Password"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }
  }
}
