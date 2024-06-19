import 'package:campmart/app/navigator/navigator.dart';
import 'package:campmart/features/dashboard/presentation/view/dashboard_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeNavigator());

class HomeNavigator {}

mixin HomeViewRoute {
  openDashboardView() {
    NavigateRoute.pushRoute(DashboardScreen());
  }
}
