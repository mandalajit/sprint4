import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe/app/constants/hive_table_constant.dart';
import 'package:recipe/features/auth/domain/entity/auth_entity.dart';

import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(7)
  final String password;

  // Constructor
  AuthHiveModel({
    String? id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  get studentId => null;

  get username => null;

  // empty constructor


  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
        id: id,
        fullname: fullname,
        email: email,
        phone: phone,
        password: password, fname: '', lname: '', username: '',
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
        id: const Uuid().v4(),
        fullname: entity.fname,
        phone: entity.phone,
        email: entity.email,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'studentId: $id, fname: $fullname, phone: $phone, email: $email, password: $password';
  }
  
  static empty() {}
}