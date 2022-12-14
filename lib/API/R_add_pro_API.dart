// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:marketapp/API/login_API.dart';
// import 'package:marketapp/API_Response/retail_add_pro_response.dart';
// import 'package:marketapp/Constants/base_url.dart';
//
// dynamic rresponsecode;
//
// class Raddproduct {
//   // Retail product add
//
//   void raddpro(context, rprounit, rprocategory, rproprice, rproquantity, rproname) async {
//     print(tokenapistatus);
//     print(bearertoken);
//     if (tokenapistatus == 200) {
//       var headers = {
//         'Authorization': 'Bearer ${bearertoken}',
//         'Content-Type': 'application/json'
//       };
//       var request = http.Request(
//           'POST',
//           Uri.parse(
//               '$baseurl/user/addProduct?productunit=${rprounit.toString()}&productCategory=${rprocategory.toString()}'));
//       request.body = json.encode({
//         "product": {
//           "productprice": rproprice.toString(),
//           "description": "descrption",
//           "imageurl": "achar.png",
//           "size": 1,
//           "discountprize": 1,
//           "color": "Red",
//           "status": "good",
//           "name": rproname.toString(),
//           "hindiName": "",
//           "productType": "RETAIL"
//         },
//         "stock": {
//           "quantity": rproquantity.toString()
//         }
//       });
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       rresponsecode = response.statusCode;
//
//       var data = jsonDecode(await response.stream.bytesToString());
//
//       print("rresponsecode = ${rresponsecode}");
//
//       if (rresponsecode == 201) {
//         print(data);
//         Retailaddproresponse().retailaddproresponse(context);
//       } else {
//         Retailaddproresponse().retailaddproresponse(context);
//         print(response.reasonPhrase);
//       }
//     }
//   }
// }
