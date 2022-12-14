import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/fav_pro_model.dart';
import 'package:marketapp/Models/wholesale_pro_list_model.dart';

dynamic favproductstatus;
dynamic favproductlist;

class Favproductlistapi {
  static Future favallpro(context, String query) async {
    // print(bearertoken);
    if (tokenapistatus == 200) {
      var headers = {
        'Authorization': 'Bearer ${bearertoken}', //
        'Content-Type': 'application/json'
      };
      // print(headers);
      var request = http.Request(
          'GET', Uri.parse('$baseurl/hp/user/getFavouriteProduct'));
      request.body = json.encode("");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      favproductstatus = response.statusCode;
      //print(favproductstatus);

      switch (favproductstatus) {
        case 201:
          final List favproductlist =
              json.decode(await response.stream.bytesToString());
          // print("Fav List: ${favproductlist}");
          return favproductlist
              .map((json) => Favprolistmodel.fromJson(json))
              .where((pro) {
            final name = pro.proname.toString().toLowerCase();
            // final price = pro.proprice.toLowerCase();
            final searchLower = query.toLowerCase();

            return name.toLowerCase().contains(searchLower); //||
            // price.contains(searchLower);
          }).toList();
          break;

        case 400:
          break;
      }
    }
  }
}
