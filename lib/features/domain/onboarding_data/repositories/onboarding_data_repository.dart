import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';

abstract class OnboardingDataRepository {
  Future<void> saveLocal(OnboardingData data);
  Future<OnboardingData?> getLocal();
  Future<void> clearLocal();

  Future<Map<String, dynamic>> submitToServer({
    required int userId,
    required String token,
    required OnboardingData data,
  });
}
