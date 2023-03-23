import 'package:flutter/material.dart';

import '../presentation/widgets/CustomButton.dart';
import '../presentation/widgets/CustomTextFormField.dart';

Widget getheightspace(double h) {
  return SizedBox(
    height: h,
  );
}

Widget getwidthspace(double h) {
  return SizedBox(
    width: h,
  );
}

Future<dynamic> myworkoutdialog(
    {context, controller, h, w, onsubmit, oncancel}) {
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("New Workout"),
          content: SizedBox(
            height: h * 0.14,
            child: Column(children: [
              CustomTextFormField(
                inputType: TextInputType.name,
                controller: controller,
                text: "Enter your Workout",
              ),
              Row(
                children: [
                  CustomButton(
                      text: "save",
                      onpressed: onsubmit,
                      h: h / 1.5,
                      w: w / 2.5),
                  getwidthspace(5.0),
                  CustomButton(
                      text: "cancel",
                      onpressed: oncancel,
                      h: h / 1.5,
                      w: w / 2.5),
                ],
              )
            ]),
          ),
        );
      }));
}

Future<dynamic> myexercisedialog(
    {context,
    namecontroller,
    setscontroller,
    repscontroller,
    weightcontroller,
    h,
    w,
    onsubmit,
    oncancel}) {
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("New Exercise"),
          content: SizedBox(
            height: h * 0.35,
            child: Column(children: [
              CustomTextFormField(
                inputType: TextInputType.name,
                controller: namecontroller,
                text: "Enter your exercise",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: setscontroller,
                text: "Enter your sets",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: repscontroller,
                text: "Enter your reps",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: weightcontroller,
                text: "Enter your Max Weight ",
              ),
              getheightspace(10.0),
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    child: CustomButton(
                        text: "save",
                        onpressed: onsubmit,
                        h: h / 1.5,
                        w: w / 2.5),
                  ),
                  getwidthspace(5.0),
                  Container(
                    color: Colors.black,
                    child: CustomButton(
                        text: "cancel",
                        onpressed: oncancel,
                        h: h / 1.5,
                        w: w / 2.5),
                  ),
                ],
              )
            ]),
          ),
        );
      }));
}

Future<dynamic> updateexercisedialogue(
    {context,
    name,
    namecontroller,
    setscontroller,
    repscontroller,
    weightcontroller,
    h,
    w,
    onsubmit,
    oncancel}) {
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("New Exercise"),
          content: SizedBox(
            height: h * 0.35,
            child: Column(children: [
              CustomTextFormField(
                inputType: TextInputType.name,
                controller: namecontroller,
                text: "update your exercise",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: setscontroller,
                text: "update your sets",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: repscontroller,
                text: "update your reps",
              ),
              CustomTextFormField(
                inputType: TextInputType.number,
                controller: weightcontroller,
                text: "update your Max Weight ",
              ),
              getheightspace(10.0),
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    child: CustomButton(
                        text: "save",
                        onpressed: onsubmit,
                        h: h / 1.5,
                        w: w / 2.5),
                  ),
                  getwidthspace(5.0),
                  Container(
                    color: Colors.black,
                    child: CustomButton(
                        text: "cancel",
                        onpressed: oncancel,
                        h: h / 1.5,
                        w: w / 2.5),
                  ),
                ],
              )
            ]),
          ),
        );
      }));
}
