class CategorySingleton {
  CategorySingleton._();

  static final CategorySingleton _ourInstance = new CategorySingleton._();

  static CategorySingleton getInstance() {
    return _ourInstance;
  }
  String _catId;

  String loadCatId() {
    return _catId;
  }

  void saveCatId(String categorySingleton) {
    this._catId = categorySingleton;
  }
}