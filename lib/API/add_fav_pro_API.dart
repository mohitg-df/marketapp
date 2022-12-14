import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/API_Response/add_fav_pro_res.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Screens/add_product_screen.dart';

dynamic addfavprocode;

class Favaddproduct {
  void addfavpro(context, prodid) async {
    if (tokenapistatus == 200) {
      var headers = {'Authorization': 'Bearer $bearertoken'};
      var request = http.Request(
          'POST',
          Uri.parse(
              '${baseurl}/hp/user/addFavouriteProduct?pid=${prodid.toString()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = jsonDecode(await response.stream.bytesToString());
      addfavprocode = response.statusCode;
      if (addfavprocode == 200) {
        print(data);
        Favresponse().favres(context);
      } else {
        print(response.reasonPhrase);
        Favresponse().favres(context);
      }
    }
  }
}
