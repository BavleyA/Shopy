import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/Cubit/cubit.dart';
import 'package:shop_app/modules/search/Cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shop_cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit , SearchStates>(
        listener: (context , state){},
        builder: (context , state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: SearchController(),
                        type: TextInputType.text,
                        validate:(value)
                        {
                          if(value!.isEmpty){
                            return 'enter text to search';
                          }
                          return null;
                        },
                      onSubmit: (String text) {
                          SearchCubit.get(context).search(text);
                      },
                        label: 'search',
                        prefix: Icons.search,
                    ),
                    const SizedBox(height: 10.0,),
                    if(state is SearchLoadingState)
                    const LinearProgressIndicator(),
                    SizedBox(height: 10.0,),

                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context , index) {
                          return buildListProducts(SearchCubit.get(context).model.data!.data![index],context);
                        },
                        separatorBuilder: (context , index ) => const Divider(color: Colors.grey,),
                        itemCount: SearchCubit.get(context).model.data!.data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
