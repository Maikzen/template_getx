import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:template/src/contracts/ai_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';

const String _baseUrl = 'https://api.openai.com/v1';

class AIService implements AIInterface {
  LocalDataInterface preferencesService;
  AIService({required this.preferencesService});

  @override
  Stream<String> getChatStream(String prompt) async* {
    String? apiKey = await preferencesService.getToken();
    const url = '$_baseUrl/chat/completions';

    var request = http.Request('POST', Uri.parse(url));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $apiKey';

    var data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": prompt}
      ],
      "stream": true,
    };
    request.body = json.encode(data);

    var response = await request.send();

    await for (var message in response.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where((event) => event.isNotEmpty)) {
      String data = message;
      data = data.replaceFirst("data: ", "");
      try {
        var json = jsonDecode(data);
        String? msn = json["choices"][0]["delta"]["content"];
        if (msn != null) {
          yield msn;
        }
      } catch (e) {
        log(message, name: "error parsing this");
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getChat(String prompt) async {
    String? apiKey = await preferencesService.getToken();

    final response = await http.post(
      Uri.parse('$_baseUrl/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "you are GPT"},
          {"role": "user", "content": prompt}
        ]
      }),
    );

    log(response.body.toString(), name: "response chat");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get completion: ${response.statusCode}');
    }
  }
}
