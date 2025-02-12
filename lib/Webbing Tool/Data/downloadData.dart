import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'data_webbing.dart';

Future<List<Webbing>?> getWebbingDataFromGithub() async {
  /// Download Data from ISA github
  /// We use the github API, the url to download content is the following : 'https://api.github.com/repos/$repoOwner/$repoName/contents/$filepath.json';
  /// For debug purpose, a Github Personnal Access Token (PAT) might be needed: without token the request rate is limited to 60 request/hour.
  /// The limit is 5000/hour with a github PAT. The key must be stored in a file named 'githubkey.json' in the assets folder (you can edit and rename the exemple file).

  const String url =
      'https://api.github.com/repos/International-Slackline-Association/slackline-data/contents/data/webbings.json';
  String bearerToken = "";
  try {
    String data = await rootBundle.loadString("assets/githubkey.json");
    final jsonResult = jsonDecode(data);

    if (jsonResult['Authorization'] != null) {
      bearerToken = jsonResult['Authorization'];
    } else {
      print(
          "WARNING : No Github Token found, the request rate is limited to 60 request/hour");
    }
  } catch (e) {
    print(
        "WARNING : Issue with the Json file of the  github token , the request rate is limited to 60 request/hour");
  }
  final http.Response response = await http.get(Uri.parse(url), headers: {
    "Accept": "application/vnd.github.object+json",
    'Authorization': bearerToken,
  });

  if (response.statusCode == 200) {
    List<Webbing> list = [];
    final List<dynamic> content = jsonDecode(utf8.decode(base64Decode(
        (jsonDecode(response.body)['content']).toString().replaceAll(
            RegExp(r'\s'),
            '')))); //Note : the Dart decode functiun does not support newline character, so they must be srtipped out.
    for (var webbing in content) {
      try {
        list.add(Webbing.fromJson(webbing));
      } catch (e) {
        print(e);
        print("Error Parsing : $webbing");
      }
    }
    return list;
  } else if (response.statusCode == 404) {
    print('User data not found.');
    return null;
  } else {
    print(
        'Failed to read user data. Status Code: ${response.statusCode}, ${response.headers}');
    return null;
  }
}
