import 'package:flutter/material.dart';

abstract class TaskEvent {}

class NewTaskEvent extends TaskEvent {}

class FinishTaskEvent extends TaskEvent {}

abstract class TaskState {}

class TaskInitialState extends TaskState{}
