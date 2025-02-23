import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model/categories_model.dart';
import 'package:shop_app/models/favourites_model/Change_favourites_model.dart';
import 'package:shop_app/models/favourites_model/Get_Favourites_Model.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favourites/Favourites_Screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/Settings_screen.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shop_cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';

class ShopCubit extends Cubit<ShopStates>{

  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar (int index){
    currentIndex = index ;
    emit(ShopChangeBottomNav());
  }

  HomeModel? homeModel;

  Map<int,bool> isFav = {};

  void getHomeDate(){
    emit(ShopLoadingState());

    DioHelper.getData(
      url: HOME,
      token:token,

    ).then((value) {
      homeModel = HomeModel.fromJson(value?.data);

      //printFullText(homeModel.toString());
      //print(homeModel?.data?.banners[0].image);
      //print(homeModel?.status);

      homeModel?.data?.products.forEach((element) {
        isFav.addAll({
          element.id!: element.inFavourite!,
        });
      });

      emit(ShopSuccessfulState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState());
    });
  }


  CategoriesModel? categoriesModel ;

  void getCategoriesDate(){

    DioHelper.getData(
      url: GET_CATEGORIES,
      token:token,

    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value?.data);


      emit(ShopSuccessfulCategoriesState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavouritesModel? changeFavouritesModel;

  void changFavourites(int productId){

    isFav[productId] = !isFav[productId]!;

    emit(ShopSuccessfulInitialChangeFavouriteState());

    DioHelper.postData(
        url: FAVOURITES,
        data: {
          'product_id' : productId,
        },
      token: token,
    )
        .then((value) {
          changeFavouritesModel = ChangeFavouritesModel.fromJson(value?.data);
          print(value?.data);

          if(!changeFavouritesModel!.status!){
            isFav[productId] = !isFav[productId]!;
          } else {
            getFavouritesDate();
          }

          emit(ShopSuccessfulChangeFavouriteState(changeFavouritesModel!));

    }).catchError((error){
      isFav[productId] = !isFav[productId]!;
      emit(ShopErrorChangeFavouriteState());
    });
  }

  FavouritesModel? favouritesModel ;

  void getFavouritesDate(){

    emit(ShopLoadingGetFavouritesState());

    DioHelper.getData(
      url: FAVOURITES,
      token:token,

    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value?.data);


      emit(ShopSuccessfulGetFavouritesState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavouritesState());
    });
  }

}