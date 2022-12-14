import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marketapp/API_Response/registration_response.dart';
import 'package:marketapp/Constants/base_url.dart';


dynamic status;

class Registerapi {
  sginupapi(context, fname, lname, mail, pwd, gender, mobile) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('$baseurl/register'));
      request.body = json.encode({
        "firstName": fname.toString(),
        "lastName": lname.toString(),
        "emailId": mail.toString(),
        "password": pwd.toString(),
        "tncAccepted": true,
        "registrationType": "USER"
        // "firstName": fname.toString(),
        // "lastName": lname.toString(),
        // "emailId": mail.toString(),
        // "password": pwd.toString(),
        // "tncAccepted": true,
        // "dob": "16/01/2022",
        // "gender": gender.toString(),
        // "phoneNo": mobile.toString(),
        // "registrationType": "USER"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var res = jsonDecode(await response.stream.bytesToString());
      status = response.statusCode;
      print(status);
      switch (status) {
        case 201:
          print("Data Entered");
          // RegistrationResponse().validate(context);
          // print(res);
          break;

        case 400:
          print("Bad Request");
      }
    } catch (e) {}
  }
}
