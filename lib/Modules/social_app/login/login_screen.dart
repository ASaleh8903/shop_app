
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Shared/components/components.dart';
import '../../../Shared/components/constans.dart';
import '../../../Shared/network/local/cache_helper.dart';
import '../../../layout/shop_app/shop_app_layout.dart';
import '../Register/Register_Screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
class ShopLoginScreen extends StatelessWidget
{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState)
          {
            final loginModel = state.loginModel;

            if (loginModel != null && loginModel.status != null)
            {
              if (state.loginModel.status!)
              {
                print(state.loginModel.message);
                print(state.loginModel.data?.token);

                CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data?.token,
                ).then((value)
                {
                  token = state.loginModel.data!.token!;

                  navigateAndFinish(
                    context,
                    ShopLayout(),
                  );
                });
              } else {
                print(loginModel.message);
                showToast(
                  text: loginModel.message!,
                  state: ToastStates.ERROR,
                );
              }
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // defaultFormField(
                        //   controller: emailController,
                        //   type: TextInputType.emailAddress,
                        //   validate: (String? value) {
                        //     if (value!.isEmpty) {
                        //       return 'please enter your email address';
                        //     }
                        //   },
                        //   label: 'Email Address',
                        //   prefix: Icons.email_outlined,
                        // ),
                        defaultFormField(
                            context: context,
                            controller: emailController,
                            validate: (String? value) {
                                 if (value!.isEmpty) {
                                   return 'please enter your email address';
                                 }
                              },
                          type: TextInputType.emailAddress,
                          label: 'e-mail',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        // defaultFormField(
                        //   controller: passwordController,
                        //   type: TextInputType.visiblePassword,
                        //   suffix: ShopLoginCubit.get(context).suffix,
                        //   onSubmit: (value) {
                        //     if (formKey.currentState!.validate()) {
                        //       ShopLoginCubit.get(context).userLogin(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //       );
                        //     }
                        //   },
                        //   isPassword: ShopLoginCubit.get(context).isPassword,
                        //   suffixPressed: () {
                        //     ShopLoginCubit.get(context)
                        //         .changePasswordVisibility();
                        //   },
                        //   validate: (String? value) {
                        //     if (value!.isEmpty) {
                        //       return 'password is too short';
                        //     }
                        //   },
                        //   label: 'Password',
                        //   prefix: Icons.lock_outline,
                        // ),
                        defaultFormField(
                            context: context,
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            validate: (String? value) {
                               if (value!.isEmpty) {
                                 return 'please enter your password';
                                   }
                           },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                 password: passwordController.text,
                                 );
                              }
                           },
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          label: 'Password',
                            prefix: Icons.lock_outline,
                            suffixPressed: () {
                              ShopLoginCubit.get(context)
                                  .changePasswordVisibility();
                            }
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                            background: Colors.deepOrange
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopRegisterScreen()
                                  )
                                );
                              },
                              text: 'register',
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