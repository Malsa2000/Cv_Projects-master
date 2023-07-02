import 'package:cv/modle/trainer_profile.dart';

abstract class TrainerProfileStates {}
class CvPostInitialState extends TrainerProfileStates {}

class createTrainerProfileSuccsesState extends TrainerProfileStates {
  createTrainerProfileSuccsesState(){}
}
class CreateTrainerProfileErrorState extends TrainerProfileStates {
  final String error;
  CreateTrainerProfileErrorState(this.error);
}
class CreateTrainerProfileLodingState extends TrainerProfileStates {

}
