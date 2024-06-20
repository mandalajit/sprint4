

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/app/navigator/navigator.dart';
import 'package:recipe/features/auth/presentation/navigator/register_navigator.dart';
import 'package:recipe/features/auth/presentation/view/login_view.dart';
import 'package:recipe/features/home/presentation/navigator/home_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, HomeViewRoute {
  void openHomeView() {}
}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}
