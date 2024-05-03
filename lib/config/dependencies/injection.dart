

import 'package:get_it/get_it.dart';

import '../../Model/data_sources/auth_service.dart';
import '../../Model/data_sources/crud_services.dart';
import '../../Model/repos/auth_repo.dart';
import '../../Model/repos/crud_repo.dart';


final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton(
    () => AuthRepo(
      service: AuthService(),
    ),
  );  locators.registerLazySingleton(
    () => CrudRepo(
      service: CrudServices(),
    ),
  );
}
