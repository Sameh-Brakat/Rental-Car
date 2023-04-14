import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/shared/cubit/cubit.dart';
import 'package:turbo_rental_car/shared/cubit/state.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'view_profile.dart';

class SettingsScreen extends StatelessWidget {
  // TimeOfDay time = TimeOfDay(hour: , minute: minute)

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

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          radius: 35, child: Image.network(model.data!.image!)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: RentalCarCubit.get(context).statusColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            model.data!.name!,
                            style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${RentalCarCubit.get(context).statusName}',
                          style: TextStyle(
                              color: RentalCarCubit.get(context).statusColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewProfile(),
                      ));
                },
                child: Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.black, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Preferences(context),
                      ));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Preferences',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: DefaultButton(
                    text: 'Sign Out',
                    onPressed: () {
                      SignOut(context);
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  Widget Preferences(context) => Scaffold(
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
            'Preferences',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Preferences(context),
                    ));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.light_mode_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dark Mode',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'off',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Spacer(),
                  if (false)
                    Icon(
                      Icons.check,
                    ),
                ],
              ),
            ),
          ]),
        ),
      );
}
