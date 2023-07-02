class GeneralQustions{
  dynamic id;
dynamic qustions;
dynamic answer;

GeneralQustions({
  this.qustions,
  this.answer,
   });

GeneralQustions.fromJson(Map<String, dynamic> map) {
  qustions = map['qustions'];
  answer = map['answer'];
 }
Map<String ,dynamic> toJson(){
    final Map<String ,dynamic> map= <String ,dynamic>{} ;
    map['answer'] = answer ;
    map['qustions'] =qustions;
    map['id']=id ;
    return map;
  }

}