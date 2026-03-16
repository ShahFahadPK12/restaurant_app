import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';

class OnboardingDataLocalDataSource {
  static const String _keyOnboardingData = "onboarding_data";

  Future<void> saveOnboardingData(OnboardingData data) async {
    // Roman Urdu: SharedPreferences me data JSON string ke form me save ho raha hai.
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(data.toJson());
    await prefs.setString(_keyOnboardingData, raw);
  }

  Future<OnboardingData?> getOnboardingData() async {
    // Roman Urdu: local storage se data read kar ke wapas entity banate hain.
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyOnboardingData);
    if (raw == null || raw.isEmpty) {
      return null;
    }

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(raw);
      return OnboardingData.fromJson(jsonMap);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearOnboardingData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyOnboardingData);
  }
}
