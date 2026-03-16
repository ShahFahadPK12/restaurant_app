import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';
import 'package:restaurant_app/features/domain/onboarding_data/repositories/onboarding_data_repository.dart';

class GetOnboardingDataLocal {
  final OnboardingDataRepository repository;

  GetOnboardingDataLocal(this.repository);

  Future<OnboardingData?> call() async {
    return repository.getLocal();
  }
}
