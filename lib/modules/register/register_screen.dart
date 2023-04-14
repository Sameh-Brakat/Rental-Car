import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
        }

        if (state is RegisterErrorState) {
          Toastt(message: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Text('Register',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultForm(
                    controller: namecontroller,
                    type: TextInputType.name,
                    label: 'Your Name',
                    preIcon: Icons.person,
                    validate: ((value) {
                      if (value!.isEmpty) {
                        return 'Name Must not be Empty';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultForm(
                    controller: phonecontroller,
                    type: TextInputType.phone,
                    label: 'Phone Number',
                    preIcon: Icons.phone,
                    validate: ((value) {
                      if (value!.isEmpty) {
                        return 'Phone Must not be Empty';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultForm(
                    controller: emailcontroller,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    preIcon: Icons.email_outlined,
                    validate: ((value) {
                      if (value!.isEmpty) {
                        return 'Email Must not be Empty';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultForm(
                    suffix: RegisterCubit.get(context).suffixIcon,
                    suffixPressed: () {
                      RegisterCubit.get(context).changePassVis();
                    },
                    isPassword: RegisterCubit.get(context).isPass,
                    submit: (value) {
                      if (formkey.currentState!.validate()) {
                        RegisterCubit.get(context).userRegister(
                            email: emailcontroller.text,
                            password: passcontroller.text,
                            name: namecontroller.text,
                            phone: phonecontroller.text);
                      }
                    },
                    controller: passcontroller,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    preIcon: Icons.lock_outline,
                    validate: ((value) {
                      if (value!.isEmpty) {
                        return 'Password Must not be Empty';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (context) => DefaultButton(
                            text: 'Register Now',
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                    email: emailcontroller.text,
                                    password: passcontroller.text,
                                    name: namecontroller.text,
                                    phone: phonecontroller.text);
                              }
                            },
                          ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text('Login Now')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
