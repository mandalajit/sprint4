import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/app/navigator/navigator.dart';
import 'package:recipe/features/auth/presentation/navigator/login_navigator.dart';
import 'package:recipe/features/home/presentation/view/home_view.dart';

final homeViewNavigatorProvider = Provider<HomeViewNavigator>((ref) {
  return HomeViewNavigator();
});

class HomeViewNavigator with LoginViewRoute {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(const HomeView() as Widget);
  }
}

class HomeView {
  const HomeView();
}
