import 'package:http/http.dart' as http;

Future<String> getHtml(String url) async {
  final uri = Uri.parse(url);
  return await http.read(uri);
}

void eval(String body, String script) {

}