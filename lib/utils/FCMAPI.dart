import 'dart:io';

import 'package:http/http.dart' as http;

class FCMApi {
  final HttpClient httpClient = HttpClient();
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  final fcmKey = "AAAAdl2ghW4:APA91bHKi4SN-k4WkQ0iZjjqvGvbA_wQY0vz1vRFz1ZXD8NHTK7PFxwrRlLGk7mMDh82usHitSDe67E8tXP5yTFkTB5RSTbj6kjmBJPD5L5C9JwRZD_WIm9lqO7HYojjik-srfJ9ejHF";

  void sendFcm(String title, String body, String fcmToken) async {
    
    var headers = {'Content-Type': 'application/json', 'Authorization': 'key=$fcmKey'};
    var request = http.Request('POST', Uri.parse(fcmUrl));
    request.body = '''{"to": "/topics/all", "priority":"high","notification":{"title":"$title","body":"$body","sound": "default"}}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
print("RESPONSE");
  print(response);
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}