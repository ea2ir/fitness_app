class Settings {
  String id_setting;
  String lang_name;
  String id_theme;
  String lang_type;

  Settings(this.id_setting,this.lang_name, this.id_theme, this.lang_type);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_setting': id_setting,
      'lang_name': lang_name,
      'id_theme': id_theme,
      'lang_type': lang_type,
    };
    return map;
  }
  Settings.fromMap(Map<String , dynamic>map){
    id_setting = map['id_setting'].toString();
    lang_name = map['lang_name'];
    id_theme = map['id_theme'].toString();
    lang_type = map['lang_type'];
  }


}
