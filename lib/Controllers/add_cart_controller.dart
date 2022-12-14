import 'package:flutter/material.dart';
import 'package:marketapp/API/Add_cart_API.dart';
import 'package:marketapp/Models/AddProducts/add_cart_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Addcartcontroller extends ControllerMVC {

  final addcartformkey = GlobalKey<FormState>();

  bool _isLoading = false;
  late Addcartmodel addcartmodel;

  Addcartcontroller() {
    this.addcartmodel =
    Addcartmodel() as Addcartmodel;
    // this.retailformmodel = Retailformmodel() as Retailformmodel;
  }

  addcartsubmit(context, custid, wsproid) {
    if (addcartformkey.currentState!.validate()) {
      // Save the wholesale form field
      addcartformkey.currentState!.save();

      setState(() {
        _isLoading = false;
      });
      // Hit API of add product
      Addcartproduct().addcartpro(
          context, wsproid, addcartmodel.proquantity);

      // Clear the text field data
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Please Enter Product Qunatity to buy Item'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
