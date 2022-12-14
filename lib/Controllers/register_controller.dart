import 'package:flutter/material.dart';
import 'package:marketapp/API/Registration_API.dart';
import 'package:marketapp/Models/register_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
class Registercontroller extends ControllerMVC {
  final registerscaffoldkey = GlobalKey<ScaffoldState>();
  final registerformkey = GlobalKey<FormState>();
  bool show_password = true;
  bool _isLoading = false;

  late Registermodel registermodel;

  Registercontroller() {
    this.registermodel = Registermodel() as Registermodel;
    // this.retailformmodel = Retailformmodel() as Retailformmodel;
  }

  registersubmit(context) {
    if (registerformkey.currentState!.validate()) {
      registerformkey.currentState!.save();
      setState(() {
        _isLoading = false;
      });
      Registerapi().sginupapi(
        context,
        registermodel.firstname,
        registermodel.lastname,
        registermodel.email,
        registermodel.password,
        registermodel.gender,
        registermodel.phonenumber,
      );
    }
    else{
      final snackBar = SnackBar(
        backgroundColor: Colors.blueGrey,
        content: Text(
          'Enter All Required Fields',
          style: TextStyle(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  regsiterreset() {
    registerformkey.currentState!.reset();
  }
}
