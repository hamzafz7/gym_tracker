// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gym_tracker/logic/cubit/app_cubit.dart';

// ignore: must_be_immutable
class WorkoutTile extends StatelessWidget {
  WorkoutTile(
      {super.key,
      required this.text,
      required this.index,
      required this.onpressed});
  String text;
  int index;
  Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) => {},
      builder: (context, state) => Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            // dismissible: DismissiblePane(onDismissed: () {
            //   BlocProvider.of<AppCubit>(context).deleteexercise(index);
            // }),
            children: [
              SlidableAction(
                onPressed: (context) {
                  BlocProvider.of<AppCubit>(context).deleteworkout(index, text);
                },
                backgroundColor: Color(0xFFFE4A49),
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
                  trailing: IconButton(
                    onPressed: onpressed,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ))),
    );
  }
}
