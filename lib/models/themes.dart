class Themes {
  String id_theme;
  String theme_name;

  Themes(this.id_theme, this.theme_name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id_theme': id_theme,
      'theme_name': theme_name,
    };
    return map;
  }
  Themes.fromMap(Map<String , dynamic>map){
    id_theme = map['id_theme'].toString();
    theme_name = map['theme_name'];
  }

}
