import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe_listing/presentation/view/recipe_listing_view.dart';

import '../../../../app/navigator/navigator.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeNavigator());

class HomeNavigator {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.pushRoute(const HomeView());
  }
}