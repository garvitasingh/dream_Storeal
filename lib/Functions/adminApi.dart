import 'dart:convert';

import 'package:http/http.dart' as http;

class AdminApiCalls{
  String artistApi = "https://artist12.herokuapp.com/api";
  late String adminId;


  //POST---------------------------------------------------------------------------
  Future<dynamic> RegisterAdmin({required String adminName, required String adminPassword}) async{
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$artistApi/adminregister'));
    request.body = json.encode({
      "email": adminName,
      "password": adminPassword,
      "password_confirmation": adminPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }
}