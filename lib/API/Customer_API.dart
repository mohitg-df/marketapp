// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:marketapp/API/login_API.dart';
// import 'package:marketapp/API_Response/customer_response.dart';
//
// dynamic custmerrescode;
// // dynamic buycustomername;
//
// class CustomerAPI{
//   Future<void> addcustomer(context, custname, custphone) async{
//     print(tokenapistatus);
//     if(tokenapistatus == 200){
//       var headers = {
//         'Authorization': 'Bearer ${bearertoken}',
//         'Content-Type': 'application/json'
//       };
//       var request = http.Request('POST', Uri.parse('http://localhost:8080/DukanApp/api/dukan/user/addcustomer'));
//       request.body = json.encode({
//         "name": custname.toString(),
//         // "lastname": custlname.toString(),
//         "email": "mohitg@gmail.com",
//         "phonenumber": custphone.toString(),
//         "tag": "active",
//         "notes": "hello",
//         "address": [
//           {
//             "pincode": 486001,
//             "city": "SATNA",
//             "state": "MP",
//             "locality": "YES",
//             "address": "Bandhavgarh Colny",
//             "landmark": "Near Sindhi Camp"
//           }
//         ]
//       });
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       custmerrescode = response.statusCode;
//
//       var data = jsonDecode(await response.stream.bytesToString());
//       // buycustomername = data[0]["firstname"][0];
//
//       if (custmerrescode == 201) {
//         print(data);
//         // print(buycustomername);
//         CustomeraddResponse().custaddres(context);
//       }
//       else {
//         CustomeraddResponse().custaddres(context);
//         print(response.reasonPhrase);
//       }
//     }
//   }
// }