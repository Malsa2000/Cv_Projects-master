import 'package:cv/bloc/cubit_singin/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvSingInCubit extends Cubit<CvSingInStates> {
  CvSingInCubit() : super(CvSingInInitialState());

  static CvSingInCubit get(context) => BlocProvider.of(context);


  void userLogin({required String email, required String password,}) {

    emit(CvSingInLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {

      print(value.user!.email!);
      print(value.user!.uid);

      emit(CvSingInSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(CvSingInErrorState(error.toString()));
    });
  }




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(CvChangePasswordVisibilityState());
  }
}
