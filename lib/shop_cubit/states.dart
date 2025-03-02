import 'package:shop_app/models/favourites_model/Change_favourites_model.dart';
import 'package:shop_app/models/login_model/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNav extends ShopStates {}

class ShopLoadingState extends ShopStates {}

class ShopSuccessfulState extends ShopStates  {}

class ShopErrorState extends ShopStates {}

class ShopSuccessfulCategoriesState extends ShopStates  {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopSuccessfulChangeFavouriteState extends ShopStates  {
  late final ChangeFavouritesModel model;
  ShopSuccessfulChangeFavouriteState(this.model);
}

class ShopSuccessfulInitialChangeFavouriteState extends ShopStates  {}

class ShopErrorChangeFavouriteState extends ShopStates {}

class ShopLoadingGetFavouritesState extends ShopStates  {}

class ShopSuccessfulGetFavouritesState extends ShopStates  {}

class ShopErrorGetFavouritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates  {}

class ShopSuccessfulGetUserDataState extends ShopStates  {
  late final LoginModel loginModel;

  ShopSuccessfulGetUserDataState(this.loginModel);
}

class ShopErrorGetUserDataState extends ShopStates {}

class ShopLoadingUpdateUserDataState extends ShopStates  {}

class ShopSuccessfulUpdateUserDataState extends ShopStates  {
  late final LoginModel loginModel;

  ShopSuccessfulUpdateUserDataState(this.loginModel);
}

class ShopErrorUpdateUserDataState extends ShopStates {}