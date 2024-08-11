import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:insurance_app/core/http_services/api_service.dart';
import 'package:insurance_app/core/http_services/life_api_service.dart';
import 'package:insurance_app/features/health_insurance/data/data_sources/get_health_insurance_package_data_source.dart';
import 'package:insurance_app/features/health_insurance/data/repositories/health_insurance_repository_impl.dart';
import 'package:insurance_app/features/health_insurance/domain/repositories/health_insurance_repository.dart';
import 'package:insurance_app/features/health_insurance/domain/usecases/get_health_insurance_packages.dart';
import 'package:insurance_app/features/health_insurance/view/states/family_health_insurance_packages_bloc/family_health_insurance_packages_bloc.dart';
import 'package:insurance_app/features/health_insurance/view/states/individual_health_insurance_packages_bloc/individual_health_insurance_packages_bloc.dart';
import 'package:insurance_app/features/life_insurance/data/data_sources/life_insurance_data_source.dart';
import 'package:insurance_app/features/life_insurance/data/repositories/life_insurance_repository_impl.dart';
import 'package:insurance_app/features/life_insurance/domain/repositories/life_insurance_repository.dart';
import 'package:insurance_app/features/life_insurance/domain/usecases/calculate_term_premium.dart';
import 'package:insurance_app/features/life_insurance/domain/usecases/get_life_riders_by_age.dart';
import 'package:insurance_app/features/life_insurance/view/states/calculate_term_premium/calculate_term_premium_bloc.dart';
import 'package:insurance_app/features/life_insurance/view/states/life_riders_by_age/life_riders_by_age_bloc.dart';
import 'package:insurance_app/features/medical_insurance_policy/data/data_sources/get_medical_insurance_package_data_source.dart';
import 'package:insurance_app/features/medical_insurance_policy/data/data_sources/register_benefit_data_source.dart';
import 'package:insurance_app/features/medical_insurance_policy/data/repositories/medical_insurance_repository_impl.dart';
import 'package:insurance_app/features/medical_insurance_policy/data/repositories/register_benefit_repository_impl.dart';
import 'package:insurance_app/features/medical_insurance_policy/domain/repositories/medical_insurance_repository.dart';
import 'package:insurance_app/features/medical_insurance_policy/domain/repositories/register_benefit_repository.dart';
import 'package:insurance_app/features/medical_insurance_policy/domain/usecases/get_medical_insurance_packages.dart';
import 'package:insurance_app/features/medical_insurance_policy/domain/usecases/register_family_medical_insurance_benefit.dart';
import 'package:insurance_app/features/medical_insurance_policy/domain/usecases/register_individual_medical_insurance_benefit.dart';
import 'package:insurance_app/features/medical_insurance_policy/views/states/medical_insurance_package_bloc/medical_insurance_package_bloc.dart';
import 'package:insurance_app/features/medical_insurance_policy/views/states/register_family_benefit/register_family_benefit_bloc.dart';
import 'package:insurance_app/features/medical_insurance_policy/views/states/register_individual_benefit/register_individual_benefit_bloc.dart';
import 'package:insurance_app/features/signup/data/datasources/remote/get_all_questions_remote_data_source.dart';
import 'package:insurance_app/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:insurance_app/features/signup/domain/repositories/signup_repository.dart';
import 'package:insurance_app/features/signup/domain/usecases/get_all_questions.dart';
import 'package:insurance_app/features/signup/view/states/all_questions/bloc/all_questions_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  const flutterSecureStorage = FlutterSecureStorage();
  serviceLocator
      .registerFactory<FlutterSecureStorage>(() => flutterSecureStorage);

  serviceLocator.registerSingleton<ApiService>(ApiService());
  serviceLocator.registerSingleton<LifeApiService>(LifeApiService());

  //bloc
  serviceLocator.registerFactory(() => AllQuestionsBloc(serviceLocator()));
  serviceLocator
      .registerFactory(() => MedicalInsurancePackageBloc(serviceLocator()));
  serviceLocator
      .registerFactory(() => RegisterIndividualBenefitBloc(serviceLocator()));
  serviceLocator
      .registerFactory(() => RegisterFamilyBenefitBloc(serviceLocator()));

  serviceLocator.registerFactory(
      () => IndividualHealthInsurancePackagesBloc(serviceLocator()));

  serviceLocator.registerFactory(
      () => FamilyHealthInsurancePackagesBloc(serviceLocator()));

  serviceLocator
      .registerFactory(() => CalculateTermPremiumBloc(serviceLocator()));
  serviceLocator.registerFactory(() => LifeRidersByAgeBloc(serviceLocator()));

  // usecase
  serviceLocator
      .registerLazySingleton(() => GetAllQuestionsUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetMedicalInsurancePackagesUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => RegisterIndividualMedicalInsuranceBenefitUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => RegisterFamilyMedicalInsuranceBenefitUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetHealthInsurancePackagesUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => CalculateTermPremiumUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetLifeRidersByAgeUseCase(serviceLocator()));

  // repository
  serviceLocator.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MedicalInsuranceRepository>(
    () => MedicalInsuranceRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<RegisterBenefitRepository>(
    () => RegisterBenefitRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HealthInsuranceRepository>(
    () => HealthInsuranceRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<LifeInsuranceRepository>(
    () => LifeInsuranceRepositoryImpl(serviceLocator()),
  );

  // data source
  serviceLocator.registerLazySingleton<GeAllQuestionsRemoteDataResource>(
    () => GetAllQuestionsRemoteDataResourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetMedicalInsurancePackageDataResource>(
    () => GetMedicalInsurancePackageDataResourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<RegisterBenefitDataResource>(
    () => RegisterBenefitDataResourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetHealthInsurancePackageDataResource>(
    () => GetHealthInsurancePackageDataResourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<LifeInsuranceDataSource>(
    () => LifeInsuranceDataSourceImpl(
      serviceLocator(),
    ),
  );
}
