import 'package:cv/modle/trainer_profile.dart';

abstract class AddNewCourseStates {}
class AddNewCourseInitialState extends AddNewCourseStates {}

//add new course
class AddNewCourseSuccsesState extends AddNewCourseStates {}
class AddNewCourseErrorState extends AddNewCourseStates {
  final String error;
  AddNewCourseErrorState(this.error);
}
class AddNewCourseLodingState extends AddNewCourseStates {}

//view course
class ViewCourseSuccsesState extends AddNewCourseStates {}
class ViewCourseErrorState extends AddNewCourseStates {
  final String error;
  ViewCourseErrorState(this.error);
}
class ViewCourseLodingState extends AddNewCourseStates {}


//on creat new path
class AddNewPathSuccesesState extends AddNewCourseStates {}
class AddNewPathErrorState extends AddNewCourseStates {
  final String error;
  AddNewPathErrorState(this.error);
}
class AddNewPathLodingState extends AddNewCourseStates {}


//on creat new lesson
class AddNewLessonSuccesesState extends AddNewCourseStates {}
class AddNewLessonErrorState extends AddNewCourseStates {
  final String error;
  AddNewLessonErrorState(this.error);
}
class AddNewLessonLodingState extends AddNewCourseStates {}

//on creat new lesson
class readPathSuccesesState extends AddNewCourseStates {}
class readPathErrorState extends AddNewCourseStates {
  final String error;
  readPathErrorState(this.error);
}
class readPathLodingState extends AddNewCourseStates {}


//on creat new quiz
class AddNewQuizSuccesesState extends AddNewCourseStates {}
class AddNewQuizErrorState extends AddNewCourseStates {
  final String error;
  AddNewQuizErrorState(this.error);
}
class AddNewQuizLodingState extends AddNewCourseStates {}


//on read new lesson
class readLessonSuccesesState extends AddNewCourseStates {}
class readLessonErrorState extends AddNewCourseStates {
  final String error;
  readLessonErrorState(this.error);
}
class readLessonLodingState extends AddNewCourseStates {}

//on Course new lesson
class readCourseSuccesesState extends AddNewCourseStates {}
class readCourseErrorState extends AddNewCourseStates {
  final String error;
  readCourseErrorState(this.error);
}
class readCourseLodingState extends AddNewCourseStates {}

//on Course new lesson
class readQuizSuccesesState extends AddNewCourseStates {}
class readQuizErrorState extends AddNewCourseStates {
  final String error;
  readQuizErrorState(this.error);
}
class readQuizLodingState extends AddNewCourseStates {}