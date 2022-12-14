import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Screens/add_product_screen.dart';

dynamic addproresponsecode;

class Addproduct {
  // Wholesale product add

  void addpro(
    context,
    unit,
    category,
    name,
    hindiname,
    type,
    price,
    quantity,
  ) async {
    // print(tokenapistatus);
    // print(bearertoken);
    if (tokenapistatus == 200) {
    var headers = {
      'Authorization': 'Bearer ${bearertoken}',
      'Content-Type': 'application/json'
    };

    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseurl/user/addProduct?productunit=${unit.toString()}&productCategory=${category.toString()}'));
    request.body = json.encode({
      "product": {
        "name": name.toString(),
        "productType": type.toString(),
        "productprice": price.toString(),
        "description": "descrption",
        "imageurl": "achar.png",
        "size": 1,
        "discountprize": 1,
        "color": "Red",
        "status": "good",
        "hindiName": hindiname.toString()
      },
      "stock": {
        "quantity": quantity.toString(),
      }
      // {
      //   "product": {
      //     "productprice": price.toString(),
      //     "description": "shivam12",
      //     "imageurl": "achar.png",
      //     "hindiName": null,
      //     "color": "Red",
      //     "status": "good",
      //     "name": name.toString(),
      //     "productType": type.toString()
      //   },
      //   "stock": {
      //     "quantity": quantity.toString()
      //   }
      // }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    addproresponsecode = response.statusCode;
    // print();
    var data = jsonDecode(await response.stream.bytesToString());
    print("addproductresponsecode = ${addproresponsecode}");
    if (addproresponsecode == 201) {
      // print(data);
      Flushbar(
        backgroundColor: Colors.lightGreen,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        message: 'Product Added For Sale Successfully',
        duration: Duration(seconds: 5),
      ).show(context);

      // Replace the Page
      Future.delayed(Duration(seconds: 1),(){
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Addproductscreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.easeInBack;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      });
      // Loginresponse().loginrole(context);
    } else {
      Flushbar(
        backgroundColor: Colors.redAccent,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        message: 'Product Added Failed',
        duration: Duration(seconds: 5),
      ).show(context);
    }
    // Wholesaleaddproresponse().wholesaleaddproresponse(context);
  }
// else {
// Wholesaleaddproresponse().wholesaleaddproresponse(context);
// print(response.reasonPhrase);
// }
}
}
// }
