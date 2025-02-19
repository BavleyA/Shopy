import 'package:shop_app/models/favourites_model/Change_favourites_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNav extends ShopStates {}

class ShopLoadingState extends ShopStates {}

class ShopSuccessfulState extends ShopStates  {}

class ShopErrorState extends ShopStates {}

class ShopSuccessfulCategoriesState extends ShopStates  {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopSuccessfulChangeFavouriteState extends ShopStates  {
  late final FavouritesModel model;
  ShopSuccessfulChangeFavouriteState(this.model);
}

class ShopSuccessfulInitialChangeFavouriteState extends ShopStates  {}

class ShopErrorChangeFavouriteState extends ShopStates {}