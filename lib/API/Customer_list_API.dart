// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:wholesale_retail/API/Login_API.dart';
// import 'package:wholesale_retail/APIResponse/login_response.dart';
// import 'package:wholesale_retail/Constants/alerts.dart';
// import 'package:wholesale_retail/Models/customer_list_model.dart';
//
// dynamic customerliststatus;
// dynamic buycustomerfname;
//
// class Customerlistapi {
//
//   static Future getCustomers(context, String query) async {
//     // print(bearertoken);
//     var headers = {'Authorization': 'Bearer ${bearertoken}'};
//
//     var request = http.Request('GET',
//         Uri.parse('http://localhost:8080/DukanApp/api/dukan/user/Customers'));
//
//     request.body = '''''';
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     customerliststatus = response.statusCode;
//     if (customerliststatus == 201) {
//       final List customerlist =
//           json.decode(await response.stream.bytesToString());
//
//       return customerlist
//           .map((json) => Customerlistmodel.fromJson(json))
//           .where((cust) {
//         final buycustomername = cust.custname.toString().toLowerCase();
//         // final price = pro.proprice.toLowerCase();
//         final searchLower = query.toLowerCase();
//
//         return buycustomername.toLowerCase().contains(searchLower); //||
//         // price.contains(searchLower);
//       }).toList();
//     }
//      else { //if (customerliststatus == 401)
//       Alerts().alerttokenexpire(context);
//       // throw Exception();
//     }
//   }
// }
