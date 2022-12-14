import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';

dynamic cartdeletestatus;

class Cartdeleteitem {
  static Future deletecartitem(context, cartitemid) async {
    if (tokenapistatus == 200) {
      var headers = {
        'Authorization': 'Bearer $bearertoken',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              '$baseurl/user/deletecart?cartid=${cartitemid}'));
      request.body = json.encode("");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      cartdeletestatus = response.statusCode;
      var data = jsonDecode(await response.stream.bytesToString());

      if (cartdeletestatus == 200) {
        Flushbar(
          backgroundColor: Colors.lightGreen,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.decelerate,
          message:
          'Product Remove In Cart',
          duration: Duration(seconds: 3),
        ).show(context);
        // print("");
        // Cartitemdelteres().itemdelete(context);
        // final snackBar = SnackBar(
        //   backgroundColor: Colors.blueGrey,
        //   content: const Text('Item Deleted In Cart'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print("Cart Item Removed: $data , $response.reasonPhrase");
        // Cartitemdelteres().itemdelete(context);
        Flushbar(
          backgroundColor: Colors.redAccent,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.decelerate,
          message:
          'Product Not Removed',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    }
  }
}
