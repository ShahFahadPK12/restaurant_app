import 'package:get_storage/get_storage.dart';

class OnboardingLocalDataSource {
  static const String keyFirstSkippedStep = "onboarding_first_skipped_step";
  static const String keyCompletedSteps = "onboarding_completed_steps";

  final GetStorage _box;

  OnboardingLocalDataSource({GetStorage? box}) : _box = box ?? GetStorage();

  Future<void> saveFirstSkippedStep(int step) async {
    await _box.write(keyFirstSkippedStep, step);
  }

  Future<void> saveCompletedSteps(int steps) async {
    await _box.write(keyCompletedSteps, steps);
  }

  int? getFirstSkippedStep() {
    final value = _box.read(keyFirstSkippedStep);
    return value is int ? value : null;
  }

  int? getCompletedSteps() {
    final value = _box.read(keyCompletedSteps);
    return value is int ? value : null;
  }
}
