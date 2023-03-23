import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker/common/constants.dart';
import 'package:gym_tracker/logic/cubit/app_cubit.dart';
import 'package:gym_tracker/presentation/widgets/AddButton.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:gym_tracker/presentation/widgets/ExerciseTile.dart';
import '../../data/models/exercisemodel.dart';

// ignore: must_be_immutable
class WorkoutScreen extends StatelessWidget {
  WorkoutScreen({super.key, required this.name});
  String? name;
  TextEditingController controller = TextEditingController();
  TextEditingController setscontroller = TextEditingController();
  TextEditingController repscontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  List<ExerciseModel> list = [];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
        child: BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
      list = [];
      BlocProvider.of<AppCubit>(context).exercisesname.forEach((element) {
        if (element.workoutname! == "$name") list.add(element);
      });
      // list = BlocProvider.of<AppCubit>(context).gettmp(name);
      return Scaffold(
          appBar: AppBar(
            title: Text(name!),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) => ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) => ExerciseTile(
                      exerciseModel: list[index],
                    ))),
            fallback: (context) => const Center(
              child: Text("No Exercises Added"),
            ),
          ),
          floatingActionButton: AddButton(onpressed: () {
            myexercisedialog(
                context: context,
                h: h,
                w: w,
                namecontroller: controller,
                setscontroller: setscontroller,
                repscontroller: repscontroller,
                weightcontroller: weightcontroller,
                oncancel: () {
                  Navigator.pop(context);
                },
                onsubmit: () {
                  // print(int.parse(setscontroller.text));
                  // print(name);
                  // print(double.parse(weightcontroller.text));
                  print(name);
                  BlocProvider.of<AppCubit>(context).addexercise(
                      name: controller.text,
                      workoutname: name!,
                      sets: int.parse(setscontroller.text),
                      reps: int.parse(repscontroller.text),
                      weight: double.parse(weightcontroller.text));
                  Navigator.pop(context);
                });
          }));
    }, listener: (context, state) {
      // if(state is Del)
    }));
  }
}
