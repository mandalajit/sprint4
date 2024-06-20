
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/failure/failure.dart';
import 'package:recipe/core/networking/local/hive_service.dart';
import 'package:recipe/features/auth/data/model/auth_hive_model.dart';
import 'package:recipe/features/auth/domain/entity/auth_entity.dart';

final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(authHiveModelProvider as ProviderListenable<AuthHiveModel>),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final AuthHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registeruser(AuthEntity user) async {
    try {
      await _hiveService.addStudent(_authHiveModel.toHiveModel(user));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginuser(
    String username,
    String password,
  ) async {
    try {
      AuthHiveModel? user = await _hiveService.login(username, password);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
