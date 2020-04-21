class ExerciseSingleton {
  ExerciseSingleton._();

  static final ExerciseSingleton _ourInstance = new ExerciseSingleton._();

  static ExerciseSingleton getInstance() {
    return _ourInstance;
  }
  String _exerciseId;

  String loadExerciseId() {
    return _exerciseId;
  }

  void saveExerciseId(String exerciseSingleton) {
    this._exerciseId = exerciseSingleton;
  }
}