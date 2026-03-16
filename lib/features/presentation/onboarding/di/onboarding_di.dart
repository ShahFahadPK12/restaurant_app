import 'package:get/get.dart';
import 'package:restaurant_app/features/data/onboarding/local/onboarding_local_data_source.dart';
import 'package:restaurant_app/features/data/onboarding/repository/onboarding_repository_impl.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/get_onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/save_onboarding_progress.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_progress_controller.dart';

const String onboardingProgressTag = "onboardingProgress";

OnboardingProgressController provideOnboardingProgressController({
  required int totalSteps,
}) {
  if (Get.isRegistered<OnboardingProgressController>(
    tag: onboardingProgressTag,
  )) {
    return Get.find<OnboardingProgressController>(
      tag: onboardingProgressTag,
    );
  }

  final localDataSource = OnboardingLocalDataSource();
  final repository = OnboardingRepositoryImpl(localDataSource);
  final getProgress = GetOnboardingProgress(repository);
  final saveProgress = SaveOnboardingProgress(repository);

  return Get.put(
    OnboardingProgressController(
      getProgress: getProgress,
      saveProgress: saveProgress,
      totalSteps: totalSteps,
    ),
    tag: onboardingProgressTag,
    permanent: true,
  );
}
