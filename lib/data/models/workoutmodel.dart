class WorkoutModel {
  int? id;
  String? workoutname;

  WorkoutModel.fromSQl(Map<String?, dynamic> mp) {
    id = mp["id"];
    workoutname = mp["workoutname"];
  }
}
