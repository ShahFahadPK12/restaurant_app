import 'package:get/get.dart';

class OnboardingController extends GetxController {

  // total steps
  final int totalSteps = 19;

  // current step
  RxInt currentStep = 0.obs;

  // skipped steps list
  RxList<int> skippedSteps = <int>[].obs;

  // first skipped step
  RxnInt firstSkippedStep = RxnInt();

  /// Next Step
  void nextStep() {

    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }

  }

  /// Previous Step
  void previousStep() {

    if (currentStep.value > 0) {
      currentStep.value--;
    }

  }

  /// Skip Step
  void skipStep() {

    // store skipped step
    skippedSteps.add(currentStep.value);

    // store first skipped step (only first time)
    firstSkippedStep.value ??= currentStep.value;

    // move to next step
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }

  }

  /// Progress Percentage
  double get progress {

    int completed = totalSteps - skippedSteps.length;

    return completed / totalSteps;

  }

}