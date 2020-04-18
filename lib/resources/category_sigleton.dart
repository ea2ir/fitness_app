class CategorySingleton {
  CategorySingleton._();

  static final CategorySingleton _ourInstance = new CategorySingleton._();

  static CategorySingleton getInstance() {
    return _ourInstance;
  }
  String catId;

  String loadCatId() {
    return catId;
  }

  void saveCatId(String categorySingleton) {
    this.catId = categorySingleton;
  }
}