// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:marketapp/API/login_API.dart';
// import 'package:marketapp/Constants/base_url.dart';
// import 'package:marketapp/Models/all_pro_model.dart';
// import 'package:marketapp/Models/wholesale_pro_list_model.dart';
//
// dynamic allproductstatus;
// dynamic allproductlist;
//
// class Allproductlistapi {
//   static Future getallpro(context, String query) async {
//     // print(bearertoken);
//     // if (tokenapistatus == 200) {
//     var headers = {
//       'Authorization': 'Bearer ${bearertoken}', //
//       'Content-Type': 'application/json'
//     };
//     // print(headers);
//     var request = http.Request(
//         'GET',
//         Uri.parse(
//             '$baseurl/hp/user/getAllProduct'));
//     request.body = json.encode("");
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//     allproductstatus = response.statusCode;
//     print(allproductstatus);
//
//     switch(allproductstatus){
//       case 201:
//         final List allproductlist =
//         json.decode(await response.stream.bytesToString());
//         print(allproductlist);
//         return allproductlist
//             .map((json) => Allprolistmodel.fromJson(json))
//             .where((pro) {
//           final name = pro.proname.toString().toLowerCase();
//           // final price = pro.proprice.toLowerCase();
//           final searchLower = query.toLowerCase();
//
//           return name.toLowerCase().contains(searchLower); //||
//           // price.contains(searchLower);
//         }).toList();
//         break;
//
//       case 400:
//         break;
//     }
//   }
// }
