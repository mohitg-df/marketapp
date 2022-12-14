// import 'package:flutter/material.dart';
// import 'package:marketapp/API/Registration_API.dart';
//
// bool _isLoading = false;
//
// class RegistrationResponse {
//
//
//   // Register Response
//   void validate(context) {
//     print(status);
//     switch (status) {
//     // Status 201
//       case 201:
//         // _isLoading = false;
//         final snackBar = SnackBar(
//           backgroundColor: Colors.blueGrey,
//           content: const Text('You Are Register'),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         Navigator.pushReplacementNamed(context, "/");
//         break;
//
//     // Status Bad Request
//       default:
//         // _isLoading = false;
//         final snackBar = SnackBar(
//           backgroundColor: Colors.redAccent,
//           content: Text(
//             'Required All Fields',
//             style: TextStyle(color: Colors.white),
//           ),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         Navigator.pushReplacementNamed(context, "/registerpage");
//         break;
//     }
//   }
// }
