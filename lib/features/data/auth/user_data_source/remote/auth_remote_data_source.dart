import "dart:convert";
import "package:http/http.dart" as http;


class AuthRemoteDataSource {
  final String baseUrl="http://10.0.2.2:1337/api";

  Future<Map<String, dynamic>> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String language,
  }) async{
    final response = await http.post(Uri.parse("$baseUrl/auth/local/register"), 
    headers:{
      "Content-Type": "application/json"
    },
    body: jsonEncode({
      "username":email,
      "email":email,
      "password":password,
      'fullName':fullName,
      "language":language,
    }));


    return jsonDecode(response.body);
  }
}