class Settings {
  String lang_name;
  int id_theme;
  String lang_type;

  Settings(this.lang_name, this.id_theme, this.lang_type);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'lang_name': lang_name,
      'id_theme': id_theme,
      'lang_type': lang_type,
    };
    return map;
  }
  Settings.fromMap(Map<String , dynamic>map){
    lang_name = map['lang_name'];
    id_theme = map['id_theme'];
    lang_type = map['lang_type'];
  }

}
