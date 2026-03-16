import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';
import 'package:restaurant_app/features/domain/onboarding_data/repositories/onboarding_data_repository.dart';

class SubmitOnboardingData {
  final OnboardingDataRepository repository;

  SubmitOnboardingData(this.repository);

  Future<Map<String, dynamic>> call({
    required int userId,
    required String token,
    required OnboardingData data,
  }) async {
    return repository.submitToServer(
      userId: userId,
      token: token,
      data: data,
    );
  }
}
