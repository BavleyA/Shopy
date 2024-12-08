import 'package:shop_app/models/login_model/login_model.dart';

abstract class ShopLoginStates {}

class LoginInitialState extends ShopLoginStates {}

class LoginLoadingState extends ShopLoginStates {}

class LoginSuccessState extends ShopLoginStates {

  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);

}

class LoginErrorState extends ShopLoginStates {

  final String error;

  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends ShopLoginStates{}