// import 'package:flutter/material.dart';
// import 'package:marketapp/API/R_add_pro_API.dart';
// import 'package:marketapp/Models/AddProducts/retail_add_pro_model.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
//
// class Rauthcontroller extends ControllerMVC {
//   final rscaffoldkey = GlobalKey<ScaffoldState>();
//
//   bool _isLoading = false;
//
//   final retailformkey = GlobalKey<FormState>();
//
//   late Retailformmodel retailformmodel;
//
//   Rauthcontroller() {
//     this.retailformmodel = Retailformmodel() as Retailformmodel;
//   }
//
//   retailsubmit(context) {
//     if (retailformkey.currentState!.validate()) {
//       // Save the wholesale form field
//       retailformkey.currentState!.save();
//
//       print("Retail Submit Button Clicked");
//       print(retailformmodel.rproductcategory);
//       print(retailformmodel.rproductname);
//       print(retailformmodel.rproductunit);
//       print(retailformmodel.rproductrate);
//       print(retailformmodel.rproductquantity);
//       setState(() {
//         _isLoading = false;
//       });
//
//       Raddproduct().raddpro(
//         context,
//         retailformmodel.rproductunit,
//         retailformmodel.rproductcategory,
//         retailformmodel.rproductrate,
//         retailformmodel.rproductquantity,
//         retailformmodel.rproductname,
//       );
//       // WSaddproduct().wsaddpro(
//       //   context,
//       //   wholesaleformmodel.productunit,
//       //   wholesaleformmodel.productcategory,
//       //   wholesaleformmodel.productrate,
//       //   wholesaleformmodel.productquantity,
//       //   wholesaleformmodel.productname,
//       // );
//     } else {
//       final snackBar = SnackBar(
//         backgroundColor: Colors.blueGrey,
//         content: Text(
//           'Enter All Required Fields',
//           style: TextStyle(color: Colors.white),
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
//
//   // retail reset button
//   retailreset() {
//     retailformkey.currentState!.reset();
//     print("Reset Button Calling");
//   }
// }
