 class  AddNewCourse{
  dynamic id;
  dynamic treinerName ;
  dynamic certifcatedOrNo;
  dynamic languges;
  dynamic numberOfLecture;
  dynamic description;
  dynamic date;
  late  List<dynamic> whataWeLearn;
  late List<dynamic> generalQustions;
  dynamic courseName;
  dynamic pathId;
  dynamic time;
  dynamic numberOfSudent;
  dynamic timeOfCourse;
  dynamic image;


  AddNewCourse({
   required this.date,
   required this.treinerName,
   required this.certifcatedOrNo,
   required this.languges,
   required this.numberOfLecture,
   required this.description,
   required this.whataWeLearn,
    required this.time,
    required this.generalQustions,
    required this.courseName,
    required this.pathId,
    required this.numberOfSudent,
    required this.timeOfCourse,
    required this.image
}); //AddNewCourse();


  AddNewCourse.fromJson(Map<String, dynamic> map) {
   date = map['date'];
   pathId = map['pathId'];
   time = map['time'];
    treinerName = map['treinerName'];
    certifcatedOrNo=map['certifcatedOrNo'];
    languges = map['languges'];
    numberOfLecture = map['numberOfLecture'];
    description = map['description'];
    whataWeLearn = map['WhataWeLearn'] ?? 0;
    courseName= map['courseName'];
    generalQustions = map['generalQustions'];
   timeOfCourse = map['timeOfCourse'];
   numberOfSudent = map['numberOfSudent'];
   image = map["image"];

  }

   Map<String ,dynamic> toJson(){
   return {
     "image" : image,
   'date' :date,
   'pathId' : pathId,
   'treinerName' : treinerName,
   'certifcatedOrNo' : certifcatedOrNo,
   'languges' : languges,
   'numberOfLecture' : numberOfLecture,
   'description' : description,
   'WhataWeLearn' : whataWeLearn,
   'courseName' : courseName,
   'generalQustions' : generalQustions,
   'time' : time,
   'id' : id,
   'numberOfSudent' : numberOfSudent,
   'timeOfCourse' : timeOfCourse,
 };
}





}
class QustionAboutCourse{
  dynamic id;
  dynamic titleOfQustion;
  dynamic answerOfQustion;
  QustionAboutCourse({
      required this.titleOfQustion,
      required this.answerOfQustion,});
  QustionAboutCourse.fromJson(Map<String, dynamic> map) {

    answerOfQustion = map['answerOfQustion'];
    titleOfQustion = map['titleOfQustion'];

  }

  Map<String ,dynamic> toJson(){
    return {
      'id' : id,
      'titleOfQustion' : titleOfQustion,
      'answerOfQustion' : answerOfQustion,
    };}

 }