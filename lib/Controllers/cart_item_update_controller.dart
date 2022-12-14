import 'package:flutter/material.dart';
import 'package:marketapp/API/cart_item_update_API.dart';
import 'package:marketapp/Models/AddProducts/cart_item_update_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Cartitemupdatecontroller extends ControllerMVC {
  // Cart form keys
  final cartitemupdateformkey = GlobalKey<FormState>();

  late Cartitemupdatemodel cartitemupdatemodel;

  Cartitemupdatecontroller() {
    this.cartitemupdatemodel = Cartitemupdatemodel() as Cartitemupdatemodel;
  }

  cartitemupdatesubmit(context, cartproid) {
    if (cartitemupdateformkey.currentState!.validate()) {

      cartitemupdateformkey.currentState!.save();

      Cartitemupdate.cartitemupdate(context, cartproid, cartitemupdatemodel.caartproquantity);

      // Clear the text field data
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
            'Please Enter Product Qunatity to Increase Your Product Quantity'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
