import "dart:convert";
import "package:http/http.dart" as http;
import "package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart";

class OnboardingRemoteDataSource {
  final String baseUrl = "http://10.0.2.2:1337/api";

  Future<Map<String, dynamic>> updateUserOnboardingData({
    required int userId,
    required String token,
    required OnboardingData data,
  }) async {
    // Roman Urdu: Strapi user endpoint par PUT request ja rahi hai.
    final response = await http.put(
      Uri.parse("$baseUrl/users/$userId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(data.toJson()),
    );

    return jsonDecode(response.body);
  }
}
