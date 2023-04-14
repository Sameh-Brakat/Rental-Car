import '../../models/login_model.dart';

abstract class RentalCarState {}

class RentalCarInitialState extends RentalCarState {}

class RentalCarChangeIndexState extends RentalCarState {}

class RentalCarChangeColorState extends RentalCarState {}

class RentalCarChangeStatusIndexState extends RentalCarState {}

class RentalCarLoadingProfileDataState extends RentalCarState {}

class RentalCarSuccessProfileDataState extends RentalCarState {
  final LoginModel loginModel;

  RentalCarSuccessProfileDataState(this.loginModel);
}

class RentalCarErrorProfileDataState extends RentalCarState {}

class RentalCarLoadingUpdateDataState extends RentalCarState {}

class RentalCarSuccessUpdateDataState extends RentalCarState {
  final LoginModel loginModel;

  RentalCarSuccessUpdateDataState(this.loginModel);
}

class RentalCarErrorUpdateDataState extends RentalCarState {}

// Get User Data From Firebase
class GetUserLoadingState extends RentalCarState{}

class GetUserSuccessState extends RentalCarState{}

class GetUserErrorState extends RentalCarState{}

// User Update
class UserUpdateLoadingState extends RentalCarState{}
class UserUpdateErrorState extends RentalCarState{}
