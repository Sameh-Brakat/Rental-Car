import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/modules/login/cubit/states.dart';
import '../../../models/login_model.dart';
import '../../../shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModeldata;

  Future<UserCredential?> UserLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    })
        .catchError((e) {
      print(e);
      emit(LoginErrorState(e));
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;

  bool isPass = true;

  void changePassVis() {
    isPass = !isPass;
    suffixIcon =
        isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangeIconPassState());
  }
}
