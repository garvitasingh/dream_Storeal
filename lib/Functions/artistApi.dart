import 'dart:convert';

import 'package:http/http.dart' as http;

class ArtistApiCalls{
  String artistApi = "https://artist12.herokuapp.com/api";
  late String artistId;

  //POST---------------------------------------------------------------------------
  Future<dynamic> RegisterArtist({required String artistMail, required String artistPassword}) async{
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse("$artistApi/artistregister"));
    request.body = json.encode({
      "email": artistMail,
      "password": artistPassword,
      "password_confirmation": artistPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res= await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final decodeData = json.decode(res);
      print(res);
      print(decodeData["id"]);
      artistId = decodeData["id"].toString();
      return artistId;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  //GET-----------------------------------------------------------------------------------
  Future<dynamic> LoginArtist({required String artistMail, required String artistPassword}) async{
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$artistApi/artistlogin'));
    request.body = json.encode({
      "email": artistMail,
      "password": artistPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res= await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final decodeData = json.decode(res);
      print(res);
      print(decodeData["id"]);
      artistId = decodeData["id"].toString();
      return artistId;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //GET ALL ARTISTS---------------------------------------------------------------------------
  Future<dynamic> ArtistList() async{
    var headers = {
      'accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$artistApi/allartists'));
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