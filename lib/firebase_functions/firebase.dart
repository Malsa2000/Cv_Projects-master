import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/modle/trainer_profile.dart';


class FirebaseTrainer{
  final  FirebaseFirestore _firestore  = FirebaseFirestore.instance;

  //create new profile
  Future<void> createProfile(TrainerProfile model) async{
    _firestore.collection('tainer').add(model.toJson()).then((value) => true)
        .catchError((error)=> false);
  }

  //read function
  show(String id) async{
    await _firestore.collection('tainer')
        .doc(id).get().
    then((value) =>
    true).catchError((error)=> false);
  }

}