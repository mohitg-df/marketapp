import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';

dynamic addcartresponsecode;

class Addcartproduct {
  // Wholesale product add

  void addcartpro(context, wsproid, wsproquantity) async {
    // print(tokenapistatus);
    print(bearertoken);
    if (tokenapistatus == 200) {
    var headers = {
      'Authorization': 'Bearer $bearertoken'
    }; //${bearertoken}
    var request = http.Request(
      'POST',
      Uri.parse(
        '$baseurl/user/addtocart?quantity=${wsproquantity.toString()}&pid=$wsproid',
      ),
    );
    request.body = '''""''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var data = jsonDecode(await response.stream.bytesToString());

    addcartresponsecode = response.statusCode;
    print(addcartresponsecode);

    switch (addcartresponsecode) {
      case 201:
        // print(data);
        Flushbar(
          backgroundColor: Colors.lightGreen,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.decelerate,
          message:
          'Product Added In Cart',
          duration: Duration(seconds: 3),
        ).show(context);
        break;

      case 400:
        print(data);
        Flushbar(
          backgroundColor: Colors.redAccent,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.decelerate,
          message:
          'Product Out Of Stock',
          duration: Duration(seconds: 3),
        ).show(context);
        break;

      default:
        Flushbar(
          backgroundColor: Colors.redAccent,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.decelerate,
          message:
          'Product Not Added In Cart',
          duration: Duration(seconds: 3),
        ).show(context);
        break;
    }
    }
  }
}
