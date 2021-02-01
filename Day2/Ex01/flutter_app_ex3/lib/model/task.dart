import 'package:flutter/material.dart';

class Task {
  final String title;
  final String subTitle;
  final String time;
  final Color startColor;
  final Color endColor;
  bool completed;

  Task({
    this.title,
    this.subTitle,
    this.time,
    this.startColor,
    this.endColor,
    this.completed,
  });
}
