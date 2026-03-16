import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/features/presentation/onboarding/controller/onboarding_controller.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen10.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen11.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen12.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen13.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen14.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen15.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen4.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen5.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen6.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen7.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen8.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/OnboardingScreen9.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/custom_bottom_button_for_onboarding.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/custom_widget_button_for_onboarding.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen16.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen17.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen18.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen19.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen20.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen21.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen22.dart';
import 'package:restaurant_app/features/presentation/onboarding/widgets/onboardingScreen23.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_progress_controller.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_data_controller.dart';
import 'package:restaurant_app/features/presentation/onboarding/controllers/onboarding_validation_controller.dart';
import 'package:restaurant_app/features/presentation/onboarding/di/onboarding_di.dart';

class OnboradingScreen3 extends StatefulWidget {
  const OnboradingScreen3({super.key, this.initialStep});

  final int? initialStep;

  @override
  State<OnboradingScreen3> createState() => _OnboradingScreen3State();
}

class _OnboradingScreen3State extends State<OnboradingScreen3> {
  static const int totalSteps = 20;
  int currentStep = 0;
  late final OnboardingProgressController _progressController;
  late final OnboardingValidationController _validationController;
  late final OnboardingDataController _dataController;
  bool _isRestoring = true;

  @override
  void initState() {
    super.initState();
    _progressController = provideOnboardingProgressController(
      totalSteps: totalSteps,
    );
    _progressController.loadProgress();
    // Create or reuse validation controller (shared across onboarding screens).
    if (Get.isRegistered<OnboardingValidationController>()) {
      _validationController = Get.find<OnboardingValidationController>();
    } else {
      _validationController = Get.put(
        OnboardingValidationController(),
        permanent: true,
      );
    }
    _dataController = provideOnboardingDataController();
    int? requestedStep = widget.initialStep;

    if (requestedStep == null) {
      final args = Get.arguments;
      if (args is Map && args["initialStep"] is int) {
        requestedStep = args["initialStep"] as int;
      }
    }

    if (requestedStep != null &&
        requestedStep >= 0 &&
        requestedStep < totalSteps) {
      currentStep = requestedStep;
    }

    // Roman Urdu: local storage se data restore kar ke controller me set.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _dataController.restoreToValidation(_validationController);
      if (mounted) {
        setState(() {
          _isRestoring = false;
        });
      }
    });
  }

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() {
        currentStep++;
      });
      _progressController.saveCompletedSteps(currentStep);
    } else {
      // Onboarding complete
      print("Onboarding Finished");
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void showCompletionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const CompletionBottomSheet();
      },
    );
  }

  Future<void> skipOnboarding() async {
    await _progressController.saveSkipStep(currentStep);
    Get.offAllNamed("/main");
  }

  Widget buildStepContent() {
    switch (currentStep) {
      case 0:
        return OnboardingScreen4();

      case 1:
        return OnboardingScreen5();

      case 2:
        return OnboardingScreen6();

      case 3:
        return OnboardingScreen7();

      case 4:
        return OnboardingScreen8();

      case 5:
        return OnboardingScreen9();

      case 6:
        return OnboardingScreen10();

      case 7:
        return OnboardingScreen11();

      case 8:
        return OnboardingScreen12();

      case 9:
        return OnboardingScreen13();

      case 10:
        return OnboardingScreen14();

      case 11:
        return OnboardingScreen15();
      case 12:
        return Onboardingscreen16();

      case 13:
        return OnboardingScreen17();
      case 14:
        return OnboardingScreen18();

      case 15:
        return Onboardingscreen19();

      case 16:
        return Onboardingscreen20();
      case 17:
        return Onboardingscreen21();

      case 18:
        return Onboardingscreen22();

      case 19:
        return Onboardingscreen23();

      default:
        return SizedBox(); //Center(child: Text("Step ${currentStep + 1}"));
    }
  }

  // List<Widget> steps = [
  //   OnboardingScreen4(),
  //   OnboardingScreen5(),
  //   OnboardingScreen6(),
  //   OnboardingScreen7(),
  //   OnboardingScreen8(),
  //   OnboardingScreen9(),
  //   OnboardingScreen10(),
  //   OnboardingScreen11(),
  //   OnboardingScreen12(),
  //   OnboardingScreen13(),
  //   OnboardingScreen14(),
  //   OnboardingScreen15(),
  //   Onboardingscreen16(),
  //   OnboardingScreen17(),
  //   OnboardingScreen18(),
  //   Onboardingscreen19(),
  //   Onboardingscreen20(),
  //   Onboardingscreen21(),
  //   Onboardingscreen22(),
  //   Onboardingscreen23(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: SafeArea(
        child: _isRestoring
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: previousStep,
                          child: Image.asset(
                            "assets/auth/back arrow.png",
                            width: 8,
                            height: 12,
                          ),
                        ),
                        SizedBox(width: 6.w),

                        Expanded(
                          // child: Obx(
                          //   () => LinearProgressIndicator(
                          //     value: controller.progress,
                          //     backgroundColor: Color.fromRGBO(209, 209, 209, 1),
                          //     color: Colors.black,
                          //     minHeight: 4,
                          //     borderRadius: BorderRadius.circular(50),
                          //   ),
                          // ),
                          child: LinearProgressIndicator(
                            value: (currentStep + 1) / totalSteps,
                            backgroundColor:
                                const Color.fromRGBO(209, 209, 209, 1),
                            color: Color.fromRGBO(0, 0, 0, 1),
                            borderRadius: BorderRadius.circular(50),

                            minHeight: 4,
                          ),
                        ),

                        SizedBox(width: 6.w),
                        GestureDetector(
                          onTap: () async => skipOnboarding(),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              height: 1,
                              color: Color.fromRGBO(10, 6, 21, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.1.h),

                    /// Dynamic Step Content
                    Expanded(child: buildStepContent()),

                    CustomBottomButtonForOnboarding(
                      text: "Next",
                      onTap: () async {
                        final error =
                            _validationController.validateStep(currentStep);
                        if (error != null) {
                          Get.snackbar(
                            "Validation",
                            error,
                            backgroundColor:
                                const Color.fromRGBO(31, 31, 31, 0.8),
                            colorText: Colors.white,
                          );
                          return;
                        }

                        // Roman Urdu: har step par data local storage me save.
                        await _dataController.saveLocally(
                          _validationController.toOnboardingData(),
                        );

                        if (currentStep == totalSteps - 1) {
                          _progressController.saveCompletedSteps(totalSteps);

                          final success =
                              await _dataController.submitLocalDataToServer();
                          if (!success) {
                            Get.snackbar(
                              "Error",
                              "Data submit nahi hua. Pehle login aur token check karein.",
                              backgroundColor:
                                  const Color.fromRGBO(31, 31, 31, 0.8),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          showCompletionBottomSheet(context);
                        } else {
                          nextStep();
                        }
                      },
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
      ),
    );
  }
}

class CompletionBottomSheet extends StatelessWidget {
  const CompletionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// 🔹 Close Button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const Spacer(),

              /// 🔹 Big Check Icon
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 58),
              ),

              const SizedBox(height: 25),

              /// 🔹 Message Text
              Text(
                "Everything is set up. Let’s head up\n to the home screen.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),

              const Spacer(),

              CustomButtonForOnboarding(
                text: "Go to Dashboard",
                onTap: () {
                  Navigator.pop(context);
                  //Get.toNamed("/home");
                  Get.offAllNamed("/main");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
