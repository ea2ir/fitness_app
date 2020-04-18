class Excercises {
  String id;
  String exercise_name;
  String id_lang;
  String id_cat;
  String id_exercise;

  Excercises(this.id,this.exercise_name, this.id_lang,this.id_cat, this.id_exercise);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'exercise_name': exercise_name,
      'id_lang': id_lang,
      'id_cat': id_cat,
      'id_exercise': id_exercise,
    };
    return map;
  }
  Excercises.fromMap(Map<String , dynamic>map){
    id = map['id'].toString();
    exercise_name = map['exercise_name'];
    id_lang = map['id_lang'].toString();
    id_cat = map['id_cat'].toString();
    id_exercise = map['id_exercise'].toString();
  }


}
