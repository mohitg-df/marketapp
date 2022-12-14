import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/cart_model.dart';
import 'package:marketapp/Models/order_hist_model.dart';

dynamic orderstatus;

class Orderhistory {
  static Future orderhist(context, String query) async {
    // print(bearertoken);
    if (tokenapistatus == 200) {
      var headers = {
        'Authorization': 'Bearer ${bearertoken}', //
        'Content-Type': 'application/json'
      };
      print(headers);
      var request = http.Request('GET', Uri.parse('$baseurl/user/invoice'));
      request.body = json.encode("");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      orderstatus = response.statusCode;
      print("History API Call: ${orderstatus}");
      if (orderstatus == 201) {
        final List orderhistlist =
            json.decode(await response.stream.bytesToString());

        return orderhistlist
            .map((json) => OrderHistModel.fromJson(json))
            .where((pro) {
          final name = pro.productname!.toLowerCase();
          // final price = pro.productPrize.toLowerCase();
          final searchLower = query.toLowerCase();

          return name.toLowerCase().contains(searchLower); //||
          // price.contains(searchLower);
        }).toList();
      }
    } else {
      // Status Code 401
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Authentication Error"),
          content: const Text("Token Expire"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("Retry"),
              ),
            ),
          ],
        ),
      );
      // Alerts().alerttokenexpire(context);
      // throw Exception();
    }
  }
}
