import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/app/navigator/navigator.dart';
import 'package:recipe/features/home/presentation/view/home_view.dart';

final homeViewNavigatorProvider = Provider<HomeViewNavigator>((ref) {
  return HomeViewNavigator();
});

class HomeViewNavigator {
  void openLoginView() {}
}


mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(const HomeView());
  }
}
