import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_ex3/model/task.dart';

List<Task> tasks = [
  Task(
      title: "Catch up with Brian",
      subTitle: "Mobile Project",
      time: "5pm",
      startColor: listRandomColor[Random().nextInt(listRandomColor.length)][0],
      endColor: listRandomColor[Random().nextInt(listRandomColor.length)][1],
      completed: false),
  Task(
      title: "Make new icons",
      subTitle: "Web App",
      time: "3pm",
      startColor: listRandomColor[Random().nextInt(listRandomColor.length)][0],
      endColor: listRandomColor[Random().nextInt(listRandomColor.length)][1],
      completed: true),
  Task(
      title: "Design explorations",
      subTitle: "Company Website",
      time: "2pm",
      startColor: listRandomColor[Random().nextInt(listRandomColor.length)][0],
      endColor: listRandomColor[Random().nextInt(listRandomColor.length)][1],
      completed: false),
  Task(
      title: "Lunch with Mary",
      subTitle: "Grill House",
      time: "12pm",
      startColor: listRandomColor[Random().nextInt(listRandomColor.length)][0],
      endColor: listRandomColor[Random().nextInt(listRandomColor.length)][1],
      completed: true),
  Task(
      title: "Teem Meeting",
      subTitle: "Hangouts",
      time: "10am",
      startColor: listRandomColor[Random().nextInt(listRandomColor.length)][0],
      endColor: listRandomColor[Random().nextInt(listRandomColor.length)][1],
      completed: true),
];

final listRandomColor = [
  [Color(0xff6DC8F3), Color(0xff73A1F9)],
  [Color(0xffFFB157), Color(0xffFFA057)],
  [Color(0xffFF5B95), Color(0xffF8556D)],
  [Color(0xffD76EF5), Color(0xff8F7AFE)],
  [Color(0xff42E695), Color(0xff3BB2B8)],
];
