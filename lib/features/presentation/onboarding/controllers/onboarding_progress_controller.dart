import 'package:get/get.dart';
import 'package:restaurant_app/features/domain/onboarding/entities/onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/get_onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/save_onboarding_progress.dart';

class OnboardingProgressController extends GetxController {
  final GetOnboardingProgress getProgress;
  final SaveOnboardingProgress saveProgress;
  final int totalSteps;

  OnboardingProgressController({
    required this.getProgress,
    required this.saveProgress,
    required this.totalSteps,
  });

  final RxInt completedSteps = 0.obs;
  final RxnInt firstSkippedStep = RxnInt();
  final RxDouble progress = 0.0.obs;
  final RxInt percent = 0.obs;
  final RxInt remaining = 0.obs;

  Future<void> loadProgress() async {
    final data = await getProgress(totalSteps: totalSteps);
    _applyProgress(data);
  }

  Future<void> saveCompletedSteps(int steps) async {
    await saveProgress.saveCompletedSteps(steps);
    _applyFromValues(completed: steps, skipped: firstSkippedStep.value);
  }

  Future<void> saveSkipStep(int step) async {
    await saveProgress.saveFirstSkippedStep(step);
    await saveProgress.saveCompletedSteps(step);
    _applyFromValues(completed: step, skipped: step);
  }

  void _applyProgress(OnboardingProgress data) {
    completedSteps.value = data.completedSteps;
    firstSkippedStep.value = data.firstSkippedStep;
    progress.value = data.progress;
    percent.value = data.percent;
    remaining.value = data.remainingSteps;
  }

  void _applyFromValues({required int completed, int? skipped}) {
    final int normalizedCompleted = _normalizeCompleted(completed);
    final int? normalizedSkipped = _normalizeSkipped(skipped);
    final double p = _calcProgress(normalizedCompleted);

    completedSteps.value = normalizedCompleted;
    firstSkippedStep.value = normalizedSkipped;
    progress.value = p;
    percent.value = (p * 100).round();
    remaining.value = totalSteps - normalizedCompleted;
  }

  int _normalizeCompleted(int value) {
    if (totalSteps <= 0) {
      return 0;
    }
    if (value < 0) {
      return 0;
    }
    if (value > totalSteps) {
      return totalSteps;
    }
    return value;
  }

  int? _normalizeSkipped(int? value) {
    if (value == null || totalSteps <= 0) {
      return null;
    }
    if (value < 0) {
      return 0;
    }
    final int max = totalSteps - 1;
    if (value > max) {
      return max;
    }
    return value;
  }

  double _calcProgress(int completed) {
    if (totalSteps <= 0) {
      return 0.0;
    }
    return completed / totalSteps;
  }
}
