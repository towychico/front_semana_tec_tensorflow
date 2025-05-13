// predict_api.dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> sendPhotoToApi(File photoFile) async {
  final uri = Uri.parse('https://web-production-5ed6.up.railway.app/predict');
  final request = http.MultipartRequest('POST', uri)
    ..headers['X-API-KEY'] = '9bed1c1ca71b0f065e71f8b3423acb16a5044cc9b81bf961ff6b1d12f7478de5'
    ..files.add(await http.MultipartFile.fromPath('file', photoFile.path));

  final response = await request.send();

  if (response.statusCode == 200) {
    final res = await http.Response.fromStream(response);
    final jsonData = jsonDecode(res.body);
    return jsonData['prediction'];
  } else {
    throw Exception('API error: ${response.statusCode}');
  }
}
