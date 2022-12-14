// import 'package:flutter/material.dart';
// import 'package:marketapp/API/Customer_API.dart';
// import 'package:marketapp/Models/customer_model.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
//
// class Customercontroller extends ControllerMVC {
//   var custformkey = GlobalKey<FormState>();
//   bool _isLoading = false;
//
//   late Customermodel customermodel;
//
//   Customercontroller() {
//     this.customermodel = Customermodel() as Customermodel;
//   }
//
//   customersubmit(context) {
//     if (custformkey.currentState!.validate()) {
//       custformkey.currentState!.save();
//       print(customermodel.custname);
//       // print(customermodel.custlname);
//       print(customermodel.custphone);
//       setState(() {
//         _isLoading = false;
//       });
//       CustomerAPI().addcustomer(
//         context,
//         customermodel.custname,
//         // customermodel.custlname,
//         customermodel.custphone,
//       );
//     }
//     else{
//       final snackBar = SnackBar(
//         backgroundColor: Colors.blueGrey,
//         content: Text(
//           'Required All Fields',
//           style: TextStyle(color: Colors.white),
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       print("Nothing To send ADDCustomer API");
//     }
//   }
//
//   customerreset() {
//     custformkey.currentState!.reset();
//   }
// }
