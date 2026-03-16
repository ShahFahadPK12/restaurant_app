import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl_standalone.dart';
import 'package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/features/presentation/onboarding/di/onboarding_di.dart';
import 'package:restaurant_app/features/presentation/onboarding/screens/onborading_screen3.dart';
import 'dart:io';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController(this.authRepository);
  var isLoading = false.obs;
  static const int _totalOnboardingSteps = 20;

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
        Get.offAllNamed("/main");
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

  Future sendOtp(String email) async {
    try {
      isLoading.value = true;
      final result = await authRepository.sendOtp(email);
      print("Send-otp api: $result");
      if (result["success"] == true) {
        Get.toNamed("/otpScreen", arguments: email);
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

  Future verifyOtp(String email, String otp) async {
    try {
      isLoading.value = true;

      final result = await authRepository.verifyOtp(email, otp);
      print("output of verfiy-otp api: $result");
      if (result["success"] == true) {
        Get.toNamed("/resetPassword", arguments: email);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Color.fromRGBO(31, 31, 31, 1),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future resetPassword(String email, String password) async {
    try {
      isLoading.value = true;
      final result = await authRepository.resetPassword(email, password);

      print("Reset-Password API: $result");

      if (result["success"] == true) {
        Get.snackbar(
          "Success",
          "Password Updated Successfully",
          backgroundColor: Color.fromRGBO(31, 31, 31, 1),
          colorText: Colors.white,
        );
        Get.offAllNamed("/login");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Color.fromRGBO(31, 31, 31, 1),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    File? imageFile,
  }) async {
    try {
      isLoading.value = true;

      final box = GetStorage();
      final dynamic userIdRaw = box.read("userId");
      final dynamic tokenRaw = box.read("token");

      if (userIdRaw is! int || tokenRaw is! String || tokenRaw.isEmpty) {
        throw "Token ya userId missing hai, pehle login karein.";
      }

      int? uploadedImageId;
      String? uploadedImageUrl;
      if (imageFile != null) {
        final uploadResult = await authRepository.uploadUserImage(
          token: tokenRaw,
          imagePath: imageFile.path,
        );
        print("uploadReult $uploadResult");

        if (uploadResult["id"] is int) {
          uploadedImageId = uploadResult["id"] as int;
        }
        // Roman Urdu: agar API image ka URL return kare to use save kar lein.
        if (uploadResult["url"] is String) {
          uploadedImageUrl = uploadResult["url"] as String;
        }
      }

      final result = await authRepository.updateUserProfile(
        userId: userIdRaw,
        token: tokenRaw,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        imageId: uploadedImageId,
      );

      if (result["error"] == null) {
        // Roman Urdu: email update ho to local storage me bhi update kar do.
        if (email.trim().isNotEmpty) {
          box.write("email", email.trim());
        }
        // Roman Urdu: full name ko bhi local storage me save kar do.
        if (fullName.trim().isNotEmpty) {
          box.write("fullName", fullName.trim());
        }
        // Roman Urdu: image URL milay to save kar do, warna local path use kar lo.
        if (uploadedImageUrl != null && uploadedImageUrl!.trim().isNotEmpty) {
          box.write("profileImage", uploadedImageUrl!.trim());
        } else if (imageFile != null) {
          box.write("profileImage", imageFile.path);
        }
        Get.snackbar(
          "Success",
          "Profile update ho gaya.",
          backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          result["error"].toString(),
          backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
          colorText: Colors.white,
        );
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
}

  // Future resetPassword(String email, String password) async {

  //   final result = await authRepository.resetPassword(email, password);
  //   if (result["success"] == true) {
  //     Get.snackbar(
  //       "Success",
  //       "Password Updated Successfully",
  //       backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
  //       colorText: Colors.white,
  //     );

  //     Get.offAllNamed("/login");
  //   } else {
  //     Get.snackbar(
  //       "Error",
  //       result['message'] ?? "password update failed",
  //       backgroundColor: Color.fromRGBO(31, 31, 31, 0.8),
  //       colorText: Colors.white,
  //     );
  //   }
  // }

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

