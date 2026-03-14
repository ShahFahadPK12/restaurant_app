import "dart:convert";
import "package:http/http.dart" as http;

class AuthRemoteDataSource {
  final String baseUrl = "http://10.0.2.2:1337/api";

  Future<Map<String, dynamic>> registerUser({
    required String fullName,
    required String email,
    required String password,
    //required String language,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/local/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": email,
        "email": email,
        "password": password,
      }),
    );

    print(response.body);
    return jsonDecode(response.body);
  }
  

  Future<Map<String, dynamic>> login({
  required String email,
  required String password,
}) async {

  final response = await http.post(
    Uri.parse("$baseUrl/auth/local"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "identifier": email,
      "password": password,
    }),
  );

  print(response.body);

  return jsonDecode(response.body);
}

 


  Future<Map<String, dynamic>> updateUser({
  required int userId,
  required String token,
  required String fullName,
  required String language,
}) async {

  final response = await http.put(
    Uri.parse("$baseUrl/users/$userId"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
    body: jsonEncode({
      "fullName": fullName,
      "language": language,
    }),
  );

  print(response.body);

  return jsonDecode(response.body);
}

Future sendOtp(String email) async{
  final response = await http.post(Uri.parse("$baseUrl/send-otp"), 
  headers: {
    "Content-type": "application/json"
  }, 
  body:jsonEncode(
    {
      "email":email,
    }
  ));

  return jsonDecode(response.body);
}

Future verifyOtp(String email, String otp)async{
  final response = await http.post(Uri.parse("$baseUrl/verfiy-otp"), 
  headers: {
    "Content-Type":"application/json"
  }, 
  body:jsonEncode({
    "email":email,
    "otp":otp,
    }));

    return jsonDecode(response.body);
}

 
}
