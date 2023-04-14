import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/modules/cars_screen/cars_screen.dart';
import 'package:turbo_rental_car/shared/cubit/state.dart';

import '../../models/login_model.dart';
import '../../models/user_model.dart';
import '../../modules/settings/settings_screen.dart';
import '../components/constants.dart';
import '../end_points.dart';
import '../network/remote/dio_helper.dart';

class RentalCarCubit extends Cubit<RentalCarState> {
  RentalCarCubit() : super(RentalCarInitialState());

  static RentalCarCubit get(context) => BlocProvider.of(context);

  int statusindex = 0;
  String statusName = 'Active';
  Color statusColor = Colors.green;

  void changeStatusIndex(int index, Color color) {
    statusindex = index;
    statusColor = color;
    if (statusindex == 0) {
      statusName = 'Active';
    }
    if (statusindex == 1) {
      statusName = 'Busy';
    }
    if (statusindex == 2) {
      statusName = 'Away';
    }
    if (statusindex == 3) {
      statusName = 'Oflline';
    }
    emit(RentalCarChangeStatusIndexState());
  }

  int indexlist1 = 0;
  int indexnav = 0;

  void changeBottomNavScreen(int index) {
    indexnav = index;
    emit(RentalCarChangeIndexState());
  }

  List<Widget> bottomNavScreen = [
    CarsScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    indexlist1 = index;
    color = Color(0xff0f5ef5);
    emit(RentalCarChangeIndexState());
  }

  Color color = Colors.white;

  LoginModel? profileModel;


  UserModel? userModel;
  void getUserData(){
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((e){
      print(e);
      emit(GetUserErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    String? image,
  }) {
    UserModel model1 = UserModel(
      name: name,
      phone: phone,
      uId: userModel!.uId,
      email: userModel!.email,
      image: image ?? userModel!.image,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .update(model1.toMap()!)
        .then((value) {
      getUserData();
    }).catchError((e) {
      print(e);
      emit(UserUpdateErrorState());
    });
  }

}
