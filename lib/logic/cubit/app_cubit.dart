import 'package:bloc/bloc.dart';
import 'package:gym_tracker/data/CasheHelper.dart';
import 'package:gym_tracker/data/models/exercisemodel.dart';
import 'package:gym_tracker/data/models/workoutmodel.dart';
part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  CasheHelper casheHelper = CasheHelper();
  List<WorkoutModel> workoutsnames = [];
  List<ExerciseModel> exercisesname = [];

  void addworkout(dynamic value) async {
    emit(WorkoutsListLoadingState());
    await casheHelper
        .insertData(
            "INSERT INTO 'workout 1' ('workoutname') VALUES ('$value') ")
        .then((value) {
      emit(WorkoutsListAddSuccessState());
      workoutsnames = [];
      loadworkouts();
    });
  }

  void loadworkouts() async {
    emit(WorkoutsLoadingstate());
    await casheHelper.readData("SELECT * FROM ('workout 1')").then((value) {
      value.forEach((e) {
        workoutsnames.add(WorkoutModel.fromSQl(e));
        emit(WorkoutSuccessState());
      });
    });
  }

  void deleteworkout(index, name) async {
    emit(WorkoutsListdeletingLoadingState());
    await casheHelper
        .deleteData2(" DELETE FROM 'exercises' WHERE workoutname = '$name'");
    await casheHelper
        .deleteData(
            "DELETE FROM 'workout 1' WHERE id = ${workoutsnames[index].id}")
        .then((_) {
      workoutsnames = [];
      exercisesname = [];
      loadexercises();
      loadworkouts();
    });
    emit(WorkoutsListdeletingSuccessState());
  }

  List<ExerciseModel> loadexercisesbyname(String name) {
    List<ExerciseModel> list = [];
    try {
      emit(ExercisesByNameLoadingstate());
      casheHelper
          .readData2("SELECT * FROM ('exercises') WHERE workoutname = '$name'")
          .then((value) {
        value.forEach((e) {
          list.add(ExerciseModel.fromSql(e));
          emit(ExercisesByNameSuccessState());
        });
      });
      return list;
    } catch (e) {
      print(e.toString());
      return list;
    }
  }

  void loadexercises() {
    emit(ExercisesLoadingstate());
    casheHelper.readData2("SELECT * FROM ('exercises')").then((value) {
      value.forEach((e) {
        exercisesname.add(ExerciseModel.fromSql(e));

        emit(ExercisesSuccessState());
      });
    });
  }

  void addexercise(
      {required String name,
      required String workoutname,
      required int reps,
      required int sets,
      required double weight}) async {
    emit(ExercisesListLoadingState());
    await casheHelper
        .insertData2(
            "INSERT INTO 'exercises' (workoutname ,exercisename , sets ,reps ,weight) VALUES ('$workoutname','$name',$sets ,$reps ,$weight )")
        .then((value) {
      exercisesname = [];
      loadexercises();
      emit(ExercisesListAddSuccessState());
    });
  }

  void deleteexercise(int id) async {
    emit(DeleteExerciseLoading());
    casheHelper.deleteData2("DELETE FROM 'exercises' WHERE id = $id").then((e) {
      exercisesname = [];
      loadexercises();
      emit(DeleteexersicesSucceded());
    });
  }

  List<ExerciseModel> gettmp(name) {
    List<ExerciseModel> tmp = [];
    exercisesname.forEach((element) {
      if (element.workoutname == "$name") {
        tmp.add(element);
      }
    });
    return tmp;
  }

  updateexercise(
      {required String name,
      required int sets,
      required int reps,
      required double weight,
      required int id}) {
    casheHelper.updateData2(
        "UPDATE 'exercises' SET exercisename = ? , sets = ? , reps = ? , weight =? WHERE id = ?  ",
        [name, sets, reps, weight, id]);
  }
}
