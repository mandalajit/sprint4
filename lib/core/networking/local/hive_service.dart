import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe/features/auth/data/model/auth_hive_model.dart';
import '../../../app/constants/hive_table_constant.dart';

final hiveServiceProvider = Provider((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(AuthHiveModelAdapter() as TypeAdapter);//add as TypeAdapter
  }




  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.id, user);
  }

  // Future<List<AuthHiveModel>> getAllStudents() async {
  //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.us);
  //   var students = box.values.toList();
  //   box.close();
  //   return students;
  // }

  //Login
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
    element.email == email && element.password == password);
    box.close();
    return user;
  }
}

class AuthHiveModelAdapter {  //this is by fixing AuthHiveModelAdapter hovering and this has beed add
}
