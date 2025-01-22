import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/modules/login/loging_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/cubit/appCubit.dart';
import 'package:shop_app/shared/cubit/appCubitStates.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:shop_app/shop_cubit/cubit.dart';

import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if(onBoarding != null){
    if(token!=null){
      widget = HomeLayout();
    }
    else widget = LogingScreen();
  }
  else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(startWidget : widget));
}

class MyApp extends StatelessWidget {

  //final bool isDark;
  final Widget startWidget;
  MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => AppCubit(),),
        BlocProvider( create: (BuildContext context) => ShopCubit()..getHomeDate(),),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context ,states) {},
        builder: (context ,states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}