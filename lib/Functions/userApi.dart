import 'dart:convert';

import 'package:http/http.dart' as http;

class UserApiCalls {
  String artistApi = "https://artist12.herokuapp.com/api";
  late String userId;

  Future<dynamic> RegisterUser({required String userMail, required String userPassword}) async{
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$artistApi/userregister'));
    request.body = json.encode({
      "email": userMail,
      "password": userPassword,
      "password_confirmation":userPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res= await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final decodeData = json.decode(res);
      print(res);
      print(decodeData["id"]);
      userId = decodeData["id"].toString();
      return userId;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<dynamic> LoginUser({required String userMail, required String userPassword}) async{
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$artistApi/userlogin'));
    request.body = json.encode({
      "email": userMail,
      "password": userPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res= await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final decodeData = json.decode(res);
      print(res);
      print(decodeData["id"]);
      userId = decodeData["id"].toString();
      return userId;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<dynamic> UserList() async{
    var headers = {
      'accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$artistApi/allusers'));
    request.body = '''''';
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