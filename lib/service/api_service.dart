import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class ApiService{


  Future<Map<String,dynamic>> fetchSongs()
  async {
    String api ='https://saavn.dev/api/search/songs?query=hindi';
    Uri uri= Uri.parse(api);
    Response response = await http.get(uri);

    if(response.statusCode == 200)
    {
      String json = response.body;
      Map<String,dynamic> songs = jsonDecode(json);
      return songs;
    }
    else{
      return {};
    }
  }
}