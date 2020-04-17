class SettingOptions {
  SettingOptions._();

  static final SettingOptions _ourInstance = new SettingOptions._();

  static SettingOptions getInstance() {
    return _ourInstance;
  }
  Map<String, String> settings;

  Map<String, String> loadSettings() {
    return settings;
  }

  void saveSettings(Map<String, String> customSettings) {
    this.settings = customSettings;
  }
}
