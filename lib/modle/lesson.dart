class Lesson{
  dynamic id;
  dynamic lessonDescription;
  dynamic lessonVedioLink ;
  dynamic lessonRessorse ;
  dynamic pathId ;
  dynamic coirseId ;

  Lesson({this.lessonDescription ,this.lessonRessorse,this.lessonVedioLink});

  Lesson.fromJson(Map<String, dynamic> map) {
    lessonDescription = map['lessonDescription'];
    lessonVedioLink = map['lessonVedioLink'];
    lessonRessorse = map['lessonRessorse'];
  }

  Map<String ,dynamic> toJson(){
    final Map<String ,dynamic> map= <String ,dynamic>{} ;
    map['lessonDescription'] = lessonDescription ;
    map['lessonVedioLink'] =lessonVedioLink;
    map['lessonRessorse'] =lessonRessorse ;
    map['id']=id ;
    map['pathId'] =pathId ;
    map['coirseId'] =coirseId ;
    return map;
  }


}