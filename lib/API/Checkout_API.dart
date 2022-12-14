import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/invoice.dart';

dynamic chekoutstatus;
dynamic checkoutdata;
// late final List checkout;

class Checkoutapi {
  static Future checkoutpro(context, String query) async {
    // print("Checkout token :${bearertoken}");
    if (tokenapistatus == 200) {
      var headers = {'Authorization': 'Bearer $bearertoken'};
      var request = http.Request(
        'POST',
        Uri.parse('$baseurl/user/checkOut'),
      );

      request.body = json.encode("");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      chekoutstatus = response.statusCode;

      print("Checkout Status: $chekoutstatus");

      if(chekoutstatus == 201){
        List checkoutdata = jsonDecode(await response.stream.bytesToString());
        print("CheckoutData: ${checkoutdata}");
        return checkoutdata
            .map((json) => InvoiceItem.fromJson(json))
            .where((pro) {
          final name = pro.proname.toLowerCase();
          // final price = pro.productPrize.toLowerCase();
          final searchLower = query.toLowerCase();

          return name.toLowerCase().contains(searchLower); //||
          // price.contains(searchLower);
        }).toList();
      }
    }
  }
}
