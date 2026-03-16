import 'package:restaurant_app/features/data/onboarding_data/local/onboarding_data_local_data_source.dart';
import 'package:restaurant_app/features/data/onboarding_data/remote/onboarding_remote_data_source.dart';
import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';
import 'package:restaurant_app/features/domain/onboarding_data/repositories/onboarding_data_repository.dart';

class OnboardingDataRepositoryImpl implements OnboardingDataRepository {
  final OnboardingDataLocalDataSource localDataSource;
  final OnboardingRemoteDataSource remoteDataSource;

  OnboardingDataRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> saveLocal(OnboardingData data) async {
    await localDataSource.saveOnboardingData(data);
  }

  @override
  Future<OnboardingData?> getLocal() async {
    return localDataSource.getOnboardingData();
  }

  @override
  Future<void> clearLocal() async {
    await localDataSource.clearOnboardingData();
  }

  @override
  Future<Map<String, dynamic>> submitToServer({
    required int userId,
    required String token,
    required OnboardingData data,
  }) async {
    return remoteDataSource.updateUserOnboardingData(
      userId: userId,
      token: token,
      data: data,
    );
  }
}
