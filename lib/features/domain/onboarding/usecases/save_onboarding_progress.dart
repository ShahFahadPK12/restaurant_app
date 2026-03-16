import 'package:restaurant_app/features/domain/onboarding/repositories/onboarding_repository.dart';

class SaveOnboardingProgress {
  final OnboardingRepository repository;

  SaveOnboardingProgress(this.repository);

  Future<void> saveFirstSkippedStep(int step) {
    return repository.saveFirstSkippedStep(step);
  }

  Future<void> saveCompletedSteps(int steps) {
    return repository.saveCompletedSteps(steps);
  }
}
