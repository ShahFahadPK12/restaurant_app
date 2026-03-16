
abstract class AuthRepository {

  Future registerUser({
    required String fullName,
    required String email,
    required String password,
    //required String language,
  });

  Future updateUser({
    required int userId,
    required String token, 
    required String fullName, 
    required String language,

  });

  Future login({
    required String email,
    required String password,
  });

Future<bool> isLoggedIn();

Future logout();

Future sendOtp(String email);

Future verifyOtp(String email, String otp);

Future resetPassword(String email, String password);

  // Roman Urdu: profile update + image upload ke liye methods.
  Future<Map<String, dynamic>> uploadUserImage({
    required String token,
    required String imagePath,
  });

  Future<Map<String, dynamic>> updateUserProfile({
    required int userId,
    required String token,
    String? fullName,
    String? email,
    String? phoneNumber,
    int? imageId,
  });

}
