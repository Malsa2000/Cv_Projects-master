import 'package:cv/modle/trainer.dart';

class PathCourse{
  dynamic id;
  dynamic pathName;
  dynamic image;
 // AddNewCourse? course;

  PathCourse({
    required this.pathName,
    this.image = "",
    //this.course,
  });
  PathCourse.fromJson(Map<String, dynamic> map) {
    pathName = map['pathName'];
    //course = map['Course'];
    image =map['image'];
    id=map['id'] ;

  }
Map<String ,dynamic> toJson(){
  final Map<String ,dynamic> map= <String ,dynamic>{} ;
    map['pathName'] = pathName ;
    map['image']= image;
    //map['Course'] = course?.toJson();

  return map;
  }




}