import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/utils/error_handler.dart';
import '../data_sources/crud_services.dart';
import '../models/model.dart';

class CrudRepo {
  late final CrudServices _service;
  CrudRepo({required CrudServices service}) {
    _service = service;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>  read() async* {
    try {
      _service.read();
    } catch (e) {
      Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> add({required Model model}) async {
    try {
      await _service.add(
        json: model.toJson(),
      );
      return const Right(true);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> delete(String id) async {
    try {
      await _service.delete(id);
      return const Right(true);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> update(
      {required String id, required Model model}) async {
    try {
      await _service.update(
        id: id,
        json: model.toJson(),
      );
      return const Right(true);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
