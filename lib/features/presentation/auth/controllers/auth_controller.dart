import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController(this.authRepository);
  var isLoading = false.obs;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String language,
  }) async {
    try {
      isLoading.value = true;
      final result = await authRepository.registerUser(
        fullName: fullName,
        email: email,
        password: password,
      );

      print(result);

      if (result["error"] == null) {
        final userId = result["user"]["id"];
        final token = result["jwt"];

        await authRepository.updateUser(
          userId: userId,
          token: token,
          fullName: fullName,
          language: language,
        );

        Get.snackbar(
          "Success",
          "Account Created Successfully",
          backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
          colorText: Colors.white,
        );

        Get.offAllNamed("/login");
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
        colorText: Colors.white,
      );
      print("Error, ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      final result = await authRepository.login(
        email: email,
        password: password,
      );

      final box = GetStorage();

      box.write("token", result["jwt"]);
      box.write("userId", result["user"]["id"]);
      box.write("email", result["user"]["email"]);

      if (result["error"] == null) {
        Get.snackbar(
          "Success",
          "Login Successful",
          backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
          colorText: Colors.white,
        );
        Get.offNamed("/onboardingScreen1");
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await authRepository.logout();

      Get.snackbar(
        "Success",
        "Logout Successfully",
        backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
        colorText: Colors.white,
      );

      Get.offAllNamed("/login");
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
        colorText: Colors.white,
      );
    }
  }

  //   Future<void> updateUser({
  //   required int userId,
  //   required String token,
  //   required String fullName,
  //   required String language,
  // }) async {

  //   try {

  //     isLoading.value = true;

  //     final result = await authRepository.updateUser(
  //       userId: userId,
  //       token: token,
  //       fullName: fullName,
  //       language: language,
  //     );

  //     print(result);

  //     Get.snackbar(
  //       "Success",
  //       "Profile Updated",
  //       backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
  //       colorText: Colors.white,
  //     );

  //   } catch (e) {

  //     Get.snackbar(
  //       "Error",
  //       e.toString(),
  //       backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
  //       colorText: Colors.white,
  //     );

  //   } finally {

  //     isLoading.value = false;

  //   }
  // }
}
