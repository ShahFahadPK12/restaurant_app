class OnboardingProgress {
  final int totalSteps;
  final int completedSteps;
  final int? firstSkippedStep;

  OnboardingProgress({
    required this.totalSteps,
    required this.completedSteps,
    required this.firstSkippedStep,
  });

  int get remainingSteps => totalSteps - completedSteps;

  double get progress {
    if (totalSteps <= 0) {
      return 0.0;
    }
    return completedSteps / totalSteps;
  }

  int get percent => (progress * 100).round();
}
