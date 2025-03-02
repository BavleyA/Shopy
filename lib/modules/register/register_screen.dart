import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/login/loging_screen.dart';
import 'package:shop_app/modules/register/cubit/cubit.dart';
import 'package:shop_app/modules/register/cubit/states.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/cubit/cubit.dart';
import '../login/cubit/states.dart';

class RegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
        listener: (context , state){
          if (state is RegisterSuccessState){

            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data?.token);

              CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value){
                token = state.loginModel.data?.token;
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder : (context)=> HomeLayout()),
                        (Route<dynamic> route) => false);

              });
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
            else{
              print(state.loginModel.message);

              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }

          }
        },
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Register Here',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text('Welcome!',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 50.0,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'please enter your Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: Icon(
                                Icons.perm_identity
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'please enter your email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Icon(
                                Icons.email_outlined
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'please enter your phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(
                                Icons.phone
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: ShopRegisterCubit.get(context).isPassword,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value){
                            if(formKey.currentState!.validate()){
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text,
                              );
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.password_outlined,
                            ),

                            suffixIcon: IconButton(
                              onPressed: (){
                                ShopRegisterCubit.get(context).changePassVisibility();
                              },
                              icon: Icon(ShopRegisterCubit.get(context).suffix),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 50,
                            child: MaterialButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  ShopRegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                }

                              },
                              child: Text(
                                'Register'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              color: Colors.deepPurple,
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          )),
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> LogingScreen()),
                                );
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
