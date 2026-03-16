import 'package:restaurant_app/features/data/onboarding/local/onboarding_local_data_source.dart';
import 'package:restaurant_app/features/domain/onboarding/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveFirstSkippedStep(int step) {
    return localDataSource.saveFirstSkippedStep(step);
  }

  @override
  Future<void> saveCompletedSteps(int steps) {
    return localDataSource.saveCompletedSteps(steps);
  }

  @override
  Future<int?> getFirstSkippedStep() async {
    return localDataSource.getFirstSkippedStep();
  }

  @override
  Future<int?> getCompletedSteps() async {
    return localDataSource.getCompletedSteps();
  }
}
