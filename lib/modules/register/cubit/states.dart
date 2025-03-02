import 'package:shop_app/models/login_model/login_model.dart';

abstract class ShopRegisterStates {}

class RegisterInitialState extends ShopRegisterStates {}

class RegisterLoadingState extends ShopRegisterStates {}

class RegisterSuccessState extends ShopRegisterStates {

  final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);

}

class RegisterErrorState extends ShopRegisterStates {

  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends ShopRegisterStates{}