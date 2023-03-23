// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gym_tracker/common/constants.dart';
import 'package:gym_tracker/logic/cubit/app_cubit.dart';

import '../../data/models/exercisemodel.dart';

// ignore: must_be_immutable
class ExerciseTile extends StatefulWidget {
  ExerciseTile({super.key, required this.exerciseModel});
  ExerciseModel exerciseModel;

  @override
  State<ExerciseTile> createState() =>
      // ignore: no_logic_in_create_state
      _ExerciseTileState(exercisemodel: exerciseModel);
}

class _ExerciseTileState extends State<ExerciseTile> {
  _ExerciseTileState({required this.exercisemodel});
  ExerciseModel exercisemodel;
  late TextEditingController name;
  late TextEditingController sets;
  late TextEditingController reps;
  late TextEditingController weight;
  var h, w;
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: exercisemodel.name);
    sets = TextEditingController(text: (exercisemodel.sets).toString());
    reps = TextEditingController(text: (exercisemodel.reps).toString());
    weight = TextEditingController(text: (exercisemodel.weight).toString());
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) => {},
      builder: (context, state) => Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            // // dismissible: DismissiblePane(onDismissed: () {
            // //   BlocProvider.of<AppCubit>(context)
            // //       .deleteexercise(exerciseModel.id!);
            // }),
            children: [
              SlidableAction(
                onPressed: (context) {
                  BlocProvider.of<AppCubit>(context)
                      .deleteexercise(widget.exerciseModel.id!);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/dumbbell2.png",
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    widget.exerciseModel.name!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      updateexercisedialogue(
                          context: context,
                          name: exercisemodel.workoutname,
                          namecontroller: name,
                          setscontroller: sets,
                          repscontroller: reps,
                          weightcontroller: weight,
                          h: h,
                          w: w,
                          onsubmit: () {
                            BlocProvider.of<AppCubit>(context).updateexercise(
                                name: name.text,
                                sets: int.parse(sets.text),
                                reps: int.parse(reps.text),
                                weight: double.parse(weight.text),
                                id: exercisemodel.id!);
                            Navigator.pop(context);
                          },
                          oncancel: () {
                            Navigator.pop(context);
                          });
                    },
                  ),
                ),
              ))),
    );
  }
}
