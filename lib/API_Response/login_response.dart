import 'package:flutter/material.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Screens/home_screen.dart';

class Loginresponse {
  // Login Response based on User
  void loginrole(context) {

    switch (customerrole) {
    // Status 201
      case "ADMIN":
        final snackBar = SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text('You Are logged in Succesfully as ADMIN'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;

      case "USER":
      // _isLoading = false;
        final snackBar = SnackBar(
          backgroundColor: Colors.blueGrey,
          content: const Text('You Are logged in Succesfully as USER'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
    }
  }

  Future loginstatus(context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Authentication Error"),
        content: const Text("Check Username and Password"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
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


