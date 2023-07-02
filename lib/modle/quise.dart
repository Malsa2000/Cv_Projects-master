class Quize{
  dynamic id;
  dynamic qustionName;
  dynamic rightAnswer;
  late List<dynamic> qustionAnswer;

  Quize({
    this.qustionName,
    required this.qustionAnswer,
    this.rightAnswer
});

  Quize.fromJson(Map<String, dynamic> map) {
    qustionName = map['qustionName'];
    qustionAnswer = map['qustionAnswer'];
    rightAnswer = map['rightAnswer'];
  }

  Map<String ,dynamic> toJson(){
    final Map<String ,dynamic> map= <String ,dynamic>{} ;
    map['qustionName'] = qustionName ;
    map['qustionAnswer'] =qustionAnswer;
    map['rightAnswer'] =rightAnswer;
    map['id']=id ;
    return map;
  }

}