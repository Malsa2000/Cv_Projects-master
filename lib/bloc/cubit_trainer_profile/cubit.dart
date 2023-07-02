import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/bloc/cubit_trainer_profile/state.dart';
import 'package:cv/core/cache_helper.dart';
import 'package:cv/modle/trainer_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../firebase_functions/firebase.dart';

class TrainerProfileCubit extends Cubit<TrainerProfileStates> {
  TrainerProfileCubit() : super(CvPostInitialState());

  static TrainerProfileCubit get(context) => BlocProvider.of(context);

  final  FirebaseFirestore _firestore  = FirebaseFirestore.instance;
  String? uTrainerName ;


  void trainerProfileCreate({
    required String firstName ,
    required String lastName,
    required String email,
    required String phoneNumer,
    required String description,
    required String city,
    required String country,
     String image ="",
  }) {
    emit(CreateTrainerProfileLodingState());

    TrainerProfile trainerProfileModel = TrainerProfile(
        firstName :firstName,
        lastName : lastName, email :email, phoneNumber :phoneNumer, descriptionJob :description,
        country :country, city :city, image :image
    );
    _firestore.collection('tainer').add(trainerProfileModel.toJson()).
    then((value) {
      emit(createTrainerProfileSuccsesState());
      true;
      this.uTrainerName = firstName;
      CacheHelper.saveData(key: "trainerName", value: uTrainerName);

    }).catchError((error) {
      emit(CreateTrainerProfileErrorState(error));
    });
  }

}