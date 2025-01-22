import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  HomeModel? homeModel ;

  void getHomeDate(){
    emit(ShopLoadingState());

    DioHelper.getData(url: HOME).then((value) {
      homeModel = HomeModel.fromJson(value?.data);

      printFullText(homeModel.toString());
      emit(ShopSuccessfulState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState());
    });
  }

}