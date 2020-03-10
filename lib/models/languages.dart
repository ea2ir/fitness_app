class Languages {
  int id_lang;
  String lang_name;

  Languages(this.id_lang, this.lang_name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_lang': id_lang,
      'lang_name': lang_name,
    };
    return map;
  }
  Languages.fromMap(Map<String , dynamic>map){
    id_lang = map['id_lang'];
    lang_name = map['lang_name'];
  }

}
