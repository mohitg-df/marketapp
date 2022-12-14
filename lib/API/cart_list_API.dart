import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/cart_model.dart';


dynamic cartstatus;

class cartapi {
  static Future getcart(context, String query) async {
    // print(bearertoken);
    if (tokenapistatus == 200) {
      var headers = {
        'Authorization': 'Bearer ${bearertoken}', //
        'Content-Type': 'application/json'
      };
      print(headers);
      var request = http.Request(
          'GET',
          Uri.parse(
              '$baseurl/user/cart'));
      request.body = json.encode("");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      cartstatus = response.statusCode;
      // print();
      if (cartstatus == 201) {
        final List productlist = json.decode(await response.stream.bytesToString());

        return productlist
            .map((json) => CartModel.fromJson(json))
            .where((pro) {
          final name = pro.productname!.toLowerCase();
          // final price = pro.productPrize.toLowerCase();
          final searchLower = query.toLowerCase();

          return name.toLowerCase().contains(searchLower); //||
          // price.contains(searchLower);
        })
        .toList();
      }
      else { // Status Code 401
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Authentication Error"),
            content: const Text("CartList, Check Internet Connection"),
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
}

