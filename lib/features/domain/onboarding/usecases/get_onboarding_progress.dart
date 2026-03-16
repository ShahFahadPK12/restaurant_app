import 'package:restaurant_app/features/domain/onboarding/entities/onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding/repositories/onboarding_repository.dart';

class GetOnboardingProgress {
  final OnboardingRepository repository;

  GetOnboardingProgress(this.repository);

  Future<OnboardingProgress> call({required int totalSteps}) async {
    if (totalSteps <= 0) {
      return OnboardingProgress(
        totalSteps: totalSteps,
        completedSteps: 0,
        firstSkippedStep: null,
      );
    }

    final completed = await repository.getCompletedSteps();
    final skipped = await repository.getFirstSkippedStep();

    final int normalizedCompleted =
        _normalizeCompleted(totalSteps, completed ?? (skipped ?? 0));
    final int? normalizedSkipped =
        skipped == null ? null : _clamp(skipped, 0, totalSteps - 1);

    return OnboardingProgress(
      totalSteps: totalSteps,
      completedSteps: normalizedCompleted,
      firstSkippedStep: normalizedSkipped,
    );
  }

  int _normalizeCompleted(int totalSteps, int value) {
    if (value < 0) {
      return 0;
    }
    if (value > totalSteps) {
      return totalSteps;
    }
    return value;
  }

  int _clamp(int value, int min, int max) {
    if (max < min) {
      return min;
    }
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }
}
