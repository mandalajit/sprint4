// ignore: unused_import
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/failure/failure.dart';

// ignore: unused_import
import '../../data/repository/auth_local_repository.dart';
import '../../data/repository/auth_remote_repository.dart';
import '../entity/auth_entity.dart';


final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
