import 'package:restaurant_app/features/domain/onboarding_data/repositories/onboarding_data_repository.dart';

class ClearOnboardingDataLocal {
  final OnboardingDataRepository repository;

  ClearOnboardingDataLocal(this.repository);

  Future<void> call() async {
    await repository.clearLocal();
  }
}
