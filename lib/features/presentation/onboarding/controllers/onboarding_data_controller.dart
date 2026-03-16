import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/clear_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/get_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/save_onboarding_data_local.dart';
import 'package:restaurant_app/features/domain/onboarding_data/usecases/submit_onboarding_data.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';

class OnboardingDataController extends GetxController {
  final SaveOnboardingDataLocal saveLocal;
  final GetOnboardingDataLocal getLocal;
  final ClearOnboardingDataLocal clearLocal;
  final SubmitOnboardingData submitToServer;
 

  OnboardingDataController({
    required this.saveLocal,
    required this.getLocal,
    required this.clearLocal,
    required this.submitToServer,
  });

  final RxBool isSubmitting = false.obs;

  Future<void> saveLocally(OnboardingData data) async {
    await saveLocal(data);
  }

  Future<void> restoreToValidation(
    OnboardingValidationController validationController,
  ) async {
    final data = await getLocal();
    if (data == null) {
      return;
    }

    // Roman Urdu: saved data ko validation controller me wapas set kar rahe hain.
    validationController.applyOnboardingData(data);
  }

  Future<bool> submitLocalDataToServer() async {
    final data = await getLocal();
    if (data == null) {
      return false;
    }

    // Roman Urdu: token aur userId GetStorage se aa rahe hain (login ke baad).
    final box = GetStorage();
    final dynamic userIdRaw = box.read("userId");
    final dynamic tokenRaw = box.read("token");

    if (userIdRaw is! int || tokenRaw is! String || tokenRaw.isEmpty) {
      return false;
    }

    isSubmitting.value = true;
    try {
      final result = await submitToServer(
        userId: userIdRaw,
        token: tokenRaw,
        data: data,
      );

      if (result["error"] == null) {
        await clearLocal();
        return true;
      }
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }
}
