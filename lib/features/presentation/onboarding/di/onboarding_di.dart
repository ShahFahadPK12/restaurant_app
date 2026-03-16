import 'package:get/get.dart';
import 'package:restaurant_app/features/data/onboarding/local/onboarding_local_data_source.dart';
import 'package:restaurant_app/features/data/onboarding_data/local/onboarding_data_local_data_source.dart';
import 'package:restaurant_app/features/data/onboarding_data/remote/onboarding_remote_data_source.dart';
import 'package:restaurant_app/features/data/onboarding_data/repository/onboarding_data_repository_impl.dart';
import 'package:restaurant_app/features/data/onboarding/repository/onboarding_repository_impl.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/get_onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding/usecases/save_onboarding_progress.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/clear_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/get_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/save_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/submit_onboarding_data.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_data_controller.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_progress_controller.dart';

const String onboardingProgressTag = "onboardingProgress";
const String onboardingDataTag = "onboardingData";

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

OnboardingDataController provideOnboardingDataController() {
  if (Get.isRegistered<OnboardingDataController>(tag: onboardingDataTag)) {
    return Get.find<OnboardingDataController>(tag: onboardingDataTag);
  }

  final localDataSource = OnboardingDataLocalDataSource();
  final remoteDataSource = OnboardingRemoteDataSource();
  final repository = OnboardingDataRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );

  final saveLocal = SaveOnboardingDataLocal(repository);
  final getLocal = GetOnboardingDataLocal(repository);
  final clearLocal = ClearOnboardingDataLocal(repository);
  final submitToServer = SubmitOnboardingData(repository);

  return Get.put(
    OnboardingDataController(
      saveLocal: saveLocal,
      getLocal: getLocal,
      clearLocal: clearLocal,
      submitToServer: submitToServer,
    ),
    tag: onboardingDataTag,
    permanent: true,
  );
}
