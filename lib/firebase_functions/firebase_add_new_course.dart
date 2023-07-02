import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/modle/trainer.dart';

class FirebaseAddNewCourse{

  //create , read , update , delete

  final  FirebaseFirestore _firestore  = FirebaseFirestore.instance;

  Future<void> create(AddNewCourse course) async{
    _firestore.collection('course').add(course.toJson()).then((value) => true)
        .catchError((error)=> false);
  }
  show(String id) async{
    await _firestore.collection('course')
        .doc(id).get().
    then((value) =>
    true).catchError((error)=> false);
  }

  Future<void> update(AddNewCourse course) async{
    _firestore.collection('course').doc(course.id)
        .update(course.toJson()).then((value) => true)
        .catchError((error)=> false);
  }
  Future<void> delete(String id) async{
    _firestore.collection('course').doc(id).delete().then((value) => true)
        .catchError((error)=> false);
  }



}