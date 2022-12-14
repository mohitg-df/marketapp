import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/Constants/base_url.dart';

dynamic updateproductstatus;

class Updateproduct {
  static Future productupdate(context, adminproductid, adminquantity) async {
    if (tokenapistatus == 200) {
    var headers = {
      'Authorization': 'Bearer ${bearertoken}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
      'POST',
      Uri.parse(
          '$baseurl/user/updateProduct?pId=${adminproductid.toString()}&quantity=${adminquantity.toString()}'),
      // '$baseurl/user/updatecartItem?quantity=${quantity.toString()}'),
    );
    request.body = json.encode({
      "product": {
        "productprice": 180,
        "description": "shivam12",
        "imageurl": "achar.png",
        "size": 18,
        "discountprize": 174,
        "color": "Red",
        "status": "ACTIVE",
        "name": "Suhgger511"
      },
      "stock": {
        "quantity": 100
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    updateproductstatus = response.statusCode;
    if (updateproductstatus == 201) {
      var data = jsonDecode(await response.stream.bytesToString());
      // print(data);
      // getgrandtotal();
      Flushbar(
        backgroundColor: Colors.lightGreen,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        message:
        'Product Quantity Updated',
        duration: Duration(seconds: 3),
      ).show(context);
      // Cartitemupdateres().itemupdate(context);
    } else {
      print(response.reasonPhrase);
      // Cartitemupdateres().itemupdate(context);
      Flushbar(
        backgroundColor: Colors.redAccent,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        message: 'Product Quantity Not Updated',
        duration: Duration(seconds: 3),
      ).show(context);
    }
  }
}
}