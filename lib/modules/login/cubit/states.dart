abstract class ShopLoginStates {}

class LoginInitialState extends ShopLoginStates {}

class LoginLoadingState extends ShopLoginStates {}

class LoginSuccessState extends ShopLoginStates {}

class LoginErrorState extends ShopLoginStates {

  final String error;

  LoginErrorState(this.error);
}