import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker/common/constants.dart';
import 'package:gym_tracker/logic/cubit/app_cubit.dart';
import 'package:gym_tracker/presentation/screens/workout_screen.dart';
import 'package:gym_tracker/presentation/widgets/AddButton.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:gym_tracker/presentation/widgets/WorkoutTile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: BlocConsumer<AppCubit, AppStates>(
            builder: (context, state) => Scaffold(
                appBar: AppBar(title: const Text("Easy gym")),
                body: ConditionalBuilder(
                  condition: BlocProvider.of<AppCubit>(context)
                      .workoutsnames
                      .isNotEmpty,
                  builder: (context) => ListView.builder(
                    itemCount:
                        BlocProvider.of<AppCubit>(context).workoutsnames.length,
                    itemBuilder: (context, index) => WorkoutTile(
                        onpressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            // print(BlocProvider.of<AppCubit>(context)
                            //     .workoutsnames[index]
                            //     .workoutname);
                            return WorkoutScreen(
                              name: BlocProvider.of<AppCubit>(context)
                                  .workoutsnames[index]
                                  .workoutname!,
                            );
                          })));
                        },
                        index: index,
                        text: BlocProvider.of<AppCubit>(context)
                            .workoutsnames[index]
                            .workoutname!),
                  ),
                  fallback: (context) => const Center(
                    child: Text("No Workouts Added"),
                  ),
                ),
                floatingActionButton: AddButton(onpressed: () {
                  myworkoutdialog(
                      context: context,
                      controller: controller,
                      h: h,
                      w: w,
                      onsubmit: () {
                        BlocProvider.of<AppCubit>(context)
                            .addworkout(controller.text);
                        controller.clear();
                        Navigator.pop(context);
                      },
                      oncancel: () {
                        controller.clear();
                        Navigator.pop(context);
                      });
                })),
            listener: (context, state) => {}));
  }
}
