class ExerciseItem {
  String id_exercise;
  String exercise_name;
  String exercise_detail;
  String id_lang;
  String qty_photos;

  ExerciseItem(this.id_exercise,this.exercise_name,this.exercise_detail, this.id_lang,this.qty_photos);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_exercise': id_exercise,
      'exercise_name': exercise_name,
      'exercise_detail': exercise_detail,
      'id_lang': id_lang,
      'qty_photos': qty_photos,
    };
    return map;
  }
  ExerciseItem.fromMap(Map<String , dynamic>map){
    id_exercise = map['id_exercise'].toString();
    exercise_name = map['exercise_name'];
    exercise_detail = map['exercise_detail'].toString();
    id_lang = map['id_lang'].toString();
    qty_photos = map['qty_photos'].toString();
  }
}
