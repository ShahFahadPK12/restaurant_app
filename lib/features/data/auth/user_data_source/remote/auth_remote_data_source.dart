import "dart:convert";
import "package:http/http.dart" as http;
import "dart:io";

class AuthRemoteDataSource {
  final String baseUrl = "http://10.0.2.2:1337/api";

  // final String baseUrl = "http://localhost:1337/api";

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
      body: jsonEncode({"identifier": email, "password": password}),
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
      body: jsonEncode({"fullName": fullName, "language": language}),
    );

    print(response.body);

    return jsonDecode(response.body);
  }

  Future sendOtp(String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/send-otp"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    return jsonDecode(response.body);
  }

  Future verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse("$baseUrl/verify-otp"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "otp": otp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {"success": false, "message": "Server error"};
    }
  }

  Future resetPassword(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/custom-password"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {"success": false, "message": "Server error"};
    }
  }

  Future<Map<String, dynamic>> uploadUserImage({
    required String token,
    required String imagePath,
  }) async {
    // Roman Urdu: image ko Strapi upload endpoint par bhejte hain.
    final request = http.MultipartRequest("POST", Uri.parse("$baseUrl/upload"));
    request.headers["Authorization"] = "Bearer $token";
    request.files.add(await http.MultipartFile.fromPath("files", imagePath));

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is List && decoded.isNotEmpty) {
      return decoded.first as Map<String, dynamic>;
    }
    return {"error": "Upload failed", "status": response.statusCode};
  }

  Future<Map<String, dynamic>> updateUserProfile({
    required int userId,
    required String token,
    String? fullName,
    String? email,
    String? phoneNumber,
    int? imageId,
  }) async {
    // Roman Urdu: sirf wahi fields bhejte hain jo user ne fill ki hon.
    final Map<String, dynamic> body = {};

    if (fullName != null && fullName.trim().isNotEmpty) {
      body["fullName"] = fullName.trim();
    }
    if (email != null && email.trim().isNotEmpty) {
      body["email"] = email.trim();
      body["username"] = email.trim(); // Strapi ke liye safe update
    }
    if (phoneNumber != null && phoneNumber.trim().isNotEmpty) {
      body["phoneNumber"] = phoneNumber.trim();
    }
    if (imageId != null) {
      body["image"] = imageId;
    }

    final response = await http.put(
      Uri.parse("$baseUrl/users/$userId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }
}
