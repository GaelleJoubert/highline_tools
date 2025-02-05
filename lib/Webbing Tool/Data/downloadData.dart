import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'data_webbing.dart';

Future<List<Webbing> ?> getWebbingDataFromGithub() async {
  /// Download Data from ISA github
  /// We use the github API, the url to download content is the following : 'https://api.github.com/repos/$repoOwner/$repoName/contents/$filepath.json';
  ///
  const String url = 'https://api.github.com/repos/International-Slackline-Association/slackline-data/contents/data/webbings.json';

  final http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      "Accept":"application/vnd.github.object+json",
      'Authorization':'Bearer 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'
    }
  );

  if (response.statusCode == 200) {
    List <Webbing> list =[];
    final List<dynamic>  content = jsonDecode(utf8.decode(base64Decode((jsonDecode(response.body)['content']).toString().replaceAll(RegExp(r'\s'), '')))); //Note : the Dart decode functiun does not support newline character, so they must be srtipped out.
    for (var webbing in content) {
      try{
        list.add(Webbing.fromJson(webbing));
      }catch(e){
        print(e);
        print ("Error Parsing : $webbing");
      }
    }
    return list;
  } else if (response.statusCode == 404) {
    print('User data not found.');
    return null;
  } else {
    print('Failed to read user data. Status Code: ${response.statusCode}, ${response.headers}');
    return null;
  }
}