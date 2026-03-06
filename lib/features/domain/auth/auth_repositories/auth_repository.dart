
abstract class AuthRepository {

  Future registerUser({
    required String fullName,
    required String email,
    required String password,
    required String language,
  });

}