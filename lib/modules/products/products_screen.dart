import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state) {},
      builder: (context , state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel!=null,
          builder: (context) => homeProductsBuilder(),
          fallback: (context) => const Center(child: CircularProgressIndicator(color: defaultColor,)),
        );
    },

    );
  }

  Widget homeProductsBuilder() => Column(
    children: [

    ],
  );
}
