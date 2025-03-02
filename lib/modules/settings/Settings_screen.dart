import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';

class SettingsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context , state){},
      builder: (context , state){

        var model = ShopCubit.get(context).userLoginModel;

        nameController.text =  model!.data!.name!;
        emailController.text =  model.data!.email!;
        phoneController.text =  model.data!.phone!;

        return  ConditionalBuilder(
          condition: ShopCubit.get(context).userLoginModel != null,
          builder: (context) =>  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if(state is ShopLoadingUpdateUserDataState)
                  const LinearProgressIndicator(),
                  const SizedBox(height: 20.0,),

                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate:(value)
                    {
                      if(value!.isEmpty){
                        return 'name must not be empty';
                      }
                      return null;

                    },
                    label: 'Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(height: 20.0,),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate:(value)
                    {
                      if(value!.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;

                    },
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  SizedBox(height: 20.0,),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate:(value)
                    {
                      if(value!.isEmpty){
                        return 'phone must not be empty';
                      }
                      return null;

                    },
                    label: 'Phone Number',
                    prefix: Icons.phone,
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    color:  defaultColor,
                    child: MaterialButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){

                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );

                        }

                      },
                      child: Text(
                        'update your data'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    color:  defaultColor,
                    child: MaterialButton(
                        onPressed: (){
                          signOut(context);
                        },
                      child: Text(
                          'LOGOUT'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}