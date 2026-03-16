abstract class OnboardingRepository {
  Future<void> saveFirstSkippedStep(int step);
  Future<void> saveCompletedSteps(int steps);

  Future<int?> getFirstSkippedStep();
  Future<int?> getCompletedSteps();
}
