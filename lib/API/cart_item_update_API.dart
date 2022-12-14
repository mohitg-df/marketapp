import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Widgets_Components/cart_list_widgetcomponent.dart';

dynamic cartupdatestatus;

class Cartitemupdate {
  static Future cartitemupdate(context, cartproductid, quantity) async {
    if (tokenapistatus == 200) {
      var headers = {
        'Authorization': 'Bearer ${bearertoken}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
        'POST',
        Uri.parse(
          '$baseurl/user/updatecartItem?quantity=${quantity.toString()}&cartid=${cartproductid.toString()}'),
            // '$baseurl/user/updatecartItem?quantity=${quantity.toString()}'),
      );
      request.body = json.encode({
        "productprice": 150,
        "description": "Aachar",
        "imageurl": "achar.png",
        "size": 18,
        "prize": 175,
        "discountprize": 174,
        "color": "Red",
        "status": "good",
        "inventory": 45
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      cartupdatestatus = response.statusCode;
      if (cartupdatestatus == 201) {
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
          message:
          'Product Quantity Not Updated',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    }
  }
}
