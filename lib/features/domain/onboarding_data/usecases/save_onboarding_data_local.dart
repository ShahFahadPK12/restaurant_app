import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';
import 'package:restaurant_app/features/domain/onboarding_data/repositories/onboarding_data_repository.dart';

class SaveOnboardingDataLocal {
  final OnboardingDataRepository repository;

  SaveOnboardingDataLocal(this.repository);

  Future<void> call(OnboardingData data) async {
    await repository.saveLocal(data);
  }
}
