import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/modules/settings/edit_profile.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';
import 'edit_status.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

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
        return Scaffold(
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
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  model.data!.image!,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model.data!.name!,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: RentalCarCubit.get(context).statusColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${RentalCarCubit.get(context).statusName}',
                      style: TextStyle(
                          color: RentalCarCubit.get(context).statusColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateTime.now().hour.toString() +
                          ':' +
                          DateTime.now().minute.toString() +
                          '    local time',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultButton(
                  border: true,
                  radius: 0,
                  colorText: Colors.black,
                  text: 'Edit Status',
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditStatus(),
                        ));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultButton(
                  border: true,
                  radius: 0,
                  colorText: Colors.black,
                  text: 'Edit Profile',
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
