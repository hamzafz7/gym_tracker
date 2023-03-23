class ExerciseModel {
  String? workoutname;
  int? id;
  String? name;
  int? sets;
  int? reps;
  double? weight;
  ExerciseModel.fromSql(Map<String, dynamic> mp) {
    id = mp['id'];
    name = mp['exercisename'];
    sets = mp["sets"];
    reps = mp["reps"];
    workoutname = mp["workoutname"];
    weight = mp["weight"];
  }
}
