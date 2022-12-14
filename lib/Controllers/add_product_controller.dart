import 'package:flutter/material.dart';
import 'package:marketapp/API/Add_pro_API.dart';
import 'package:marketapp/Models/Add_pro_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class Addproductauthcontroller extends ControllerMVC {
  bool _isLoading = false;

  final addproductformkey = GlobalKey<FormState>();

  late Addproductmodel addproductmodel;

  Addproductauthcontroller() {
    this.addproductmodel = Addproductmodel() as Addproductmodel;
    // this.retailformmodel = Retailformmodel() as Retailformmodel;
  }

  addproductsubmit(context) {
    if (addproductformkey.currentState!.validate()) {
      // Save the wholesale form field
      addproductformkey.currentState!.save();

      print("Wholesale Submit Button Clicked");
      print(addproductmodel.producttype);
      print(addproductmodel.productcategory);
      print(addproductmodel.productname);
      print(addproductmodel.hindiproductname);
      print(addproductmodel.productunit);
      print(addproductmodel.productrate);
      print(addproductmodel.productquantity);

      setState(() {
        _isLoading = false;
      });

      // Hit API of add product
      Addproduct().addpro(
        context,
        addproductmodel.productunit,
        addproductmodel.productcategory,
        addproductmodel.productname,
        addproductmodel.hindiproductname,
        addproductmodel.producttype,
        addproductmodel.productrate,
        addproductmodel.productquantity,
      );
    } else {
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

  // reset calling Button
  addproductreset() {
    addproductformkey.currentState?.reset();
    // addproductformkey.currentState!.save();
    print("Reset Button Calling");
  }
}

