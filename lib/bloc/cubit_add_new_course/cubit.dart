import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/cache_helper.dart';
import 'package:cv/modle/lesson.dart';
import 'package:cv/modle/quise.dart';
import 'package:cv/modle/trainer.dart';
import 'package:cv/modle/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCourseCubit extends Cubit<AddNewCourseStates> {
  AddNewCourseCubit() : super(AddNewCourseInitialState());

  static AddNewCourseCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? uTrainerName;
  String _uploadedImageUrl = "";

  Future<String> uploadImage(File image) async {
    final storage = FirebaseStorage.instance;
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef = storage.ref().child('images/$imageName.jpg');

    final UploadTask uploadTask = storageRef.putFile(image);
    print(image);
    final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);

      final String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      return downloadUrl;

  //  return '';
  }

  Future<void> creatPath({
    required String pathName,
    required File image,
    //AddNewCourse? course,
  })async{
    emit(AddNewPathLodingState());
     PathCourse pathCourse = PathCourse(pathName: pathName ,image: uploadImage(image));
    _firestore.collection('PathCourse').add
      (pathCourse.toJson()).
    then((value) {
      print(image);

      emit(AddNewPathSuccesesState());
      createCourse(pathId: value.id, image: image);
      true;
    }).catchError((error)=> {
      emit(AddNewPathErrorState(error)),
      print("this error ... $error"),
      false
    });}


  Future<void> createCourse({
    String? certifcatedOrNo,
    String? languges,
    String? numberOfLecture,
    String? description,
    List<dynamic>? whataWeLearn,
    List<dynamic>? generalQustions,
     String? courseName,
    required String pathId,
     String? date,
     String? numberOfStudent,
     String? timeOfL,
     String? itemPath,
     File? image })
  async{
    emit(AddNewCourseLodingState());
    uTrainerName= CacheHelper.getData(key: "trainerName");
    AddNewCourse course = AddNewCourse(
          image: _uploadImage(image!),
         time : "time",
        pathId: pathId,
         date: date,
         numberOfSudent  :numberOfStudent,
         timeOfCourse: timeOfL,
         whataWeLearn: whataWeLearn!
        , generalQustions: generalQustions!
        , treinerName: "uTrainerName"
        ,description: description
        ,certifcatedOrNo: certifcatedOrNo
        , courseName: courseName
        , languges: languges,
        numberOfLecture: numberOfLecture);
    _firestore.collection("PathCourse").doc(pathId).collection("Course").add
    (course.toJson()).then((value) {
      emit(AddNewCourseSuccsesState());
      true;
    }).catchError((error)=> {
      emit(AddNewCourseErrorState(error)),
      print("this error m... $error"),
      false
    });}

  Future<void> _uploadImage(File _pickedImage) async {
    if (_pickedImage == null) return ;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
     FirebaseStorage.instance.ref().child("course").child(fileName).putFile(_pickedImage!).
     then((value){
       value.ref.getDownloadURL().then((value){
         print(value);
       });
     });
  }

  Future<void> createNewLesson({
    required String descriptionLesson,
    required String vedioLinkLesson,
    required String lessonResoucr,
    required String pathId,
    required String courseId,
  })
  async{
    emit(AddNewLessonLodingState());
    Lesson lesson = Lesson(
      lessonDescription: descriptionLesson,
      lessonRessorse: lessonResoucr,
      lessonVedioLink: vedioLinkLesson
      );
    _firestore.collection("PathCourse").doc(pathId)
        .collection("Course").doc(courseId).collection('Lessons').add
      (lesson.toJson()).then((value) {
      emit(AddNewLessonSuccesesState());
      true;
    }).catchError((error)=> {
      emit(AddNewLessonErrorState(error)),
      print("this error ... $error"),
      false
    });}

  Future<void> creatQuiz({
    required String quizeTitle,
    required String rightAnswer,
    required List<String> answerQuiz,
    required String pathId,
    required String courseId,
    required String lessonId,

  })async{
    emit(AddNewQuizLodingState());
    Quize quize = Quize(qustionAnswer: answerQuiz ,rightAnswer: rightAnswer,qustionName: quizeTitle);
    _firestore.collection("PathCourse").doc(pathId)
        .collection("Course").doc(courseId).collection('Lessons')..doc(lessonId).collection('Quiz').add
      (quize.toJson()).
    then((value) {
      emit(AddNewQuizSuccesesState());
      createCourse(pathId: value.id);
      true;
    }).catchError((error)=> {
      emit(AddNewQuizErrorState(error)),
      print("this error ... $error"),
      false
    });}


//read path
  List<Map<String, PathCourse>> pathList = [];
  List<String> pathID = [];
  List<Map<String, PathCourse>> readpath() {
    _firestore.collection('PathCourse').get().then((value) {
      pathList = [];
      pathID =[];
      for (var doc in value.docs) {
        pathList.add({doc.reference.id: PathCourse.fromJson(doc.data())});
        pathID.add(doc.id);
      }
      emit(readPathSuccesesState());
    }).catchError((error)=> {
      emit(readPathErrorState(error)),
      false
    });
  return pathList;
  }



  //read Course
  List<Map<String, AddNewCourse>> courseList = [];
  List<String> courseID = [];
  List<Map<String, AddNewCourse>> readcourse(String id) {
    _firestore.collection("PathCourse").doc(id).collection('Course').get().then((value) {
      courseList = [];
      courseID =[];
      for (var doc in value.docs) {
        courseList.add({doc.reference.id: AddNewCourse.fromJson(doc.data())});
        courseID.add(doc.id);
      }
      emit(readCourseSuccesesState());
    }).catchError((error)=> {
      emit(readCourseErrorState(error)),
      false
    });
    return courseList;
  }


  //read Lessons
  List<Map<String, Lesson>> lessonList = [];
  List<String> lessonID = [];
  List<Map<String, Lesson>> readLessons(String pathId ,String courseId) {
    _firestore.collection("PathCourse").doc(pathId).collection('Course')
        .doc(courseId).collection('Lessons').get().then((value) {
      lessonList = [];
      lessonID =[];
      for (var doc in value.docs) {
        lessonList.add({doc.reference.id: Lesson.fromJson(doc.data())});
        lessonID.add(doc.id);
      }
      emit(readLessonSuccesesState());
    }).catchError((error)=> {
      emit(readLessonErrorState(error)),
      false
    });
    return lessonList;
  }


  //read quiz
  List<Map<String, Quize>> quizList = [];
  List<String> quizID = [];
  List<Map<String, Quize>> readQuiz(String pathId ,String courseId ,String lessonId ) {
    _firestore.collection("PathCourse").doc(pathId).collection('Course')
        .doc(courseId).collection('Lessons').doc(lessonId).collection('Quiz').get().then((value) {
      quizList = [];
      quizID =[];
      for (var doc in value.docs) {
        quizList.add({doc.reference.id: Quize.fromJson(doc.data())});
        quizID.add(doc.id);
      }
      emit(readQuizSuccesesState());
    }).catchError((error)=> {
      emit(readQuizErrorState(error)),
      false
    });
    return quizList;
  }


}