class Categories {
  String id;
  String cat_name;
  String id_lang;
  String id_cat;

  Categories(this.id,this.cat_name, this.id_lang, this.id_cat);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'cat_name': cat_name,
      'id_lang': id_lang,
      'id_cat': id_cat,
    };
    return map;
  }
  Categories.fromMap(Map<String , dynamic>map){
    id = map['id'].toString();
    cat_name = map['cat_name'];
    id_lang = map['id_lang'].toString();
    id_cat = map['id_cat'].toString();
  }


}
