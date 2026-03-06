
import 'package:restaurant_app/features/data/auth/user_data_source/remote/auth_remote_data_source.dart';
import 'package:restaurant_app/features/domain/auth/auth_repositories/auth_repository.dart';

class UserRepository implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  UserRepository(this.remoteDataSource);

  @override
  Future registerUser({
    required String fullName,
    required String email, 
    required String password,
    required String language,
  }) async{
    final response = await remoteDataSource.registerUser(
      fullName: fullName, 
      email: email, 
      password: password, 
      language: language
      );
    return response;
  }
}