

import 'package:get/get.dart';
import 'package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart';

class AuthController extends GetxController{
  final AuthRepository authRepository;
  AuthController(this.authRepository);
  var isLoading=false.obs;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String language,
  }) async{
    try{
      isLoading.value=true;
      await authRepository.registerUser(
        fullName: fullName, 
        email: email, 
        password: password, 
        language: language
        );

        Get.snackbar("Success", "Account Created Successfully");
        Get.offAllNamed("/login");
    }
    catch(e){
      Get.snackbar("Error", e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }
}