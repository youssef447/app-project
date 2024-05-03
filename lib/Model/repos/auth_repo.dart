import 'package:dartz/dartz.dart';

import '../../core/utils/error_handler.dart';
import '../data_sources/auth_service.dart';

class AuthRepo {
  late final AuthService _service;
  AuthRepo({required AuthService service}) {
    _service = service;
  }

  ///returns token
  Future<Either<Failure, String?>> login() async {
    try {
      final response = await _service.login();

      return const Right(
        'userToken or model to be saved locally',
      );
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> logout() async {
    try {
      await _service.logout();
      return const Right(true);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
