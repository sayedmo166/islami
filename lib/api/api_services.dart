import 'dart:convert';

import 'package:http/http.dart' as http;

import '../tabs/radio/radioModel.dart';

class ApiServices {
 static Future<Autogenerated> getRadios()async {
    var url = Uri.https('mp3quran.net', '/api/v3/radios',{'language':'ar'});
    var response = await http.get(url);
    var json =jsonDecode(response.body);
   return Autogenerated.fromJson(json);
  }
}
