class SettingOptions {
  SettingOptions._();

  static final SettingOptions _ourInstance = new SettingOptions._();

  static SettingOptions getInstance() {
    return _ourInstance;
  }
  Map<String, String> _settings;

  Map<String, String> loadSettings() {
    return _settings;
  }

  void saveSettings(Map<String, String> customSettings) {
    this._settings = customSettings;
  }
}
