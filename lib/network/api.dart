import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/network/api_and_keys.dart';

class API {


  static Future<List<dynamic>> getVideo() async {
    var response =  await http.get(Uri.parse(youtube_API));
    var decodedResponse = jsonDecode(response.body); 
    
    List<dynamic> videos = decodedResponse["items"] as List<dynamic>;
    // print(videos);
    return videos;
  }
}