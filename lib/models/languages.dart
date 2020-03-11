class Languages {
  String id_lang;
  String lang_name;
  String lang_type;

  Languages(this.id_lang, this.lang_name, this.lang_type);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_lang': id_lang,
      'lang_name': lang_name,
      'lang_type': lang_type,
    };
    return map;
  }
  Languages.fromMap(Map<String , dynamic>map){
    id_lang = map['id_lang'].toString();
    lang_name = map['lang_name'];
    lang_type = map['lang_type'];
  }

}
