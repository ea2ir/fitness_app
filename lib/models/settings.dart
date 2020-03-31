class Settings {
  String id_setting;
  String lang_name;
  String id_theme;
  String lang_type;
  String id_lang;
  String theme_name;


  Settings(this.id_setting, this.lang_name, this.id_theme, this.lang_type,
           this.id_lang, this.theme_name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_setting': id_setting,
      'lang_name': lang_name,
      'id_theme': id_theme,
      'lang_type': lang_type,
      'id_lang': id_lang,
      'theme_name': theme_name,
    };
    return map;
  }
  Settings.fromMap(Map<String , dynamic>map){
    id_setting = map['id_setting'].toString();
    lang_name = map['lang_name'];
    id_theme = map['id_theme'].toString();
    lang_type = map['lang_type'];
    id_lang = map['id_lang'].toString();
    theme_name = map['theme_name'];
  }


}
