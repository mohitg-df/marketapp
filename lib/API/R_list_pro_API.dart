import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/Constants/base_url.dart';
import 'package:marketapp/Models/retail_pro_list_model.dart';

dynamic rproductstatus;

class RProductlistapi {
  static Future getProducts(context, String query) async {
    // print(bearertoken);

    if (tokenapistatus == 200) {
      var headers = {'Authorization': 'Bearer ${bearertoken}'}; //

      var request = http.Request(
          'GET',
          Uri.parse(
              '$baseurl/user/getproducts'));

      request.body = '''''';

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      rproductstatus = response.statusCode;
      if (rproductstatus == 201) {
        final List productlist =
            json.decode(await response.stream.bytesToString());

        return productlist
            .map((json) => Retailprolistmodel.fromJson(json))
            .where((pro) {
          final name = pro.rproname.toLowerCase();
          // final price = pro.proprice.toLowerCase();
          final searchLower = query.toLowerCase();

          return name.toLowerCase().contains(searchLower); //||
          // price.contains(searchLower);
        }).toList();
      } else {
        // Alerts().alerttokenexpire(context);
        // throw Exception();
      }
    }
  }
}
