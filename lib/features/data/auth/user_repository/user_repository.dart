import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/features/data/auth/user_data_source/remote/auth_remote_data_source.dart';
import 'package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart';

class UserRepository implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  UserRepository(this.remoteDataSource);

  @override
  Future registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.registerUser(
      fullName: fullName,
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future updateUser({
    required int userId,
    required String token,
    required String fullName,
    required String language,
  }) async {
    final response = await remoteDataSource.updateUser(
      userId: userId,
      token: token,
      fullName: fullName,
      language: language,
    );

    return response;
  }

  @override
  Future login({required String email, required String password}) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    return response;
  }

  @override
  Future<bool> isLoggedIn() async {
    final box = GetStorage();
    final token = box.read("token");
    return token != null;
  }

  @override
  Future logout() async {
    final box = GetStorage();

    box.remove("token");
    box.remove("userId");
    box.remove("email");
  }
}
