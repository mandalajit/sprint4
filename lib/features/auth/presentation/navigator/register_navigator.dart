import 'package:campmart/app/navigator/navigator.dart';
import 'package:campmart/features/auth/presentation/view/register_view.dart';
import 'package:campmart/features/auth/presentation/view/login_view.dart';

class RegisterViewNavigator {}

class LoginViewNavigator {}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(RegisterView());
  }
  
  openLoginView() {
    NavigateRoute.pushRoute(LoginView());
  }
}
