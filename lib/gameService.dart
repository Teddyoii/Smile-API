import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smile_api_new/models/level.dart';

int gameLevel = 1;

Future<Level?> getGameLevel() async {
  try {
    http.Response res = await http.get(Uri.parse('https://marcconrad.com/uob/smile/api.php'));
    if(res.statusCode == 200) {
      var jsonData  = res.body;
      print("Fetch Success "+jsonData.toString());
      Level level = Level.fromJson(jsonDecode(jsonData));
      return level;
    }
    return null;
  } catch (e) {
    print("Fetch Error "+e.toString());
    return null;
  }
  
}