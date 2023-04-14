import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RentalCarCubit, RentalCarState>(
      listener: (context, state) {
        if (state is RentalCarSuccessUpdateDataState) {
          if (state.loginModel.status) {
            Toastt(
              message: state.loginModel.message!,
              state: ToastStates.SUCCESS,
            );
          } else {
            Toastt(
              message: state.loginModel.message!,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var model = RentalCarCubit.get(context).profileModel!;
        nameController.text = model.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) => Scaffold(
            backgroundColor: Color(0xffe4e3e3),
            appBar: AppBar(
              backgroundColor: Color(0xffe4e3e3),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              title: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            'https://student.valuxapps.com/storage/assets/defaults/user.jpg',
                            fit: BoxFit.fill,
                            scale: 1.8,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            width: 200,
                            child: DefaultButton(
                              border: true,
                              radius: 0,
                              colorText: Colors.black,
                              text: 'Edit Status',
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    ConditionalBuilder(
                      condition: state is RentalCarLoadingUpdateDataState,
                      builder: (context) => LinearProgressIndicator(),
                      fallback: (context) => Container(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          DefaultForm(
                            controller: nameController,
                            type: TextInputType.name,
                            label: '',
                            preIcon: Icons.person,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Name Must not be Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DefaultForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: '',
                            preIcon: Icons.email,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Email Must not be Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DefaultForm(
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: '',
                            preIcon: Icons.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Phone Must not be Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                              text: 'Update',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RentalCarCubit.get(context).updateUser(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );

    ;
  }
}
