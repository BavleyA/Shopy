import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/categories_model/categories_model.dart';
import 'package:shop_app/models/favourites_model/Get_Favourites_Model.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context , state ){},
      builder: (context , state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavouritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context , index) {
              var favouritesData = ShopCubit.get(context).favouritesModel?.data?.data;
              if (favouritesData == null || favouritesData.isEmpty) {
                return const Center(child: Text('No favourites available.'));
              }
              return buildFavItem(favouritesData[index], context);
            },
            separatorBuilder: (context , index ) => const Divider(color: Colors.grey,),
            itemCount: ShopCubit.get(context).favouritesModel!.data!.data!.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItem(FavouritesData model , context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.product!.image!),
                width: 120.0,
                height: 120.0,
              ),
              if (model.product?.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.product!.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.product!.price!.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    if (model.product?.discount! != 0)
                      Text(
                        model.product!.oldPrice!.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ShopCubit.get(context).changFavourites(model.product!.id!);
                        //print(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).isFav[model.product?.id]! ? defaultColor : Colors.grey ,
                        child: const Icon(
                          Icons.favorite_outline_rounded,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
