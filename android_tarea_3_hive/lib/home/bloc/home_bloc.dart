import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:android_tarea_3_hive/models/todo_remainder.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final remainderBox = Hive.box('todoRemainders'); //new
  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is OnLoadRemindersEvent) {
      try {
        List<TodoRemainder> _existingReminders = _loadReminders();
        yield LoadedRemindersState(todosList: _existingReminders);
      } on DatabaseDoesNotExist catch (_) {
        yield NoRemindersState();
      } on EmptyDatabase catch (_) {
        yield NoRemindersState();
      }
    }
    if (event is OnAddElementEvent) {
      _saveTodoReminder(event.todoReminder);
      yield NewReminderState(todo: event.todoReminder);
    }
    if (event is OnReminderAddedEvent) {
      yield AwaitingEventsState();
    }
    if (event is OnRemoveElementEvent) {
      _removeTodoReminder(event.removedAtIndex);
    }
  }

  List<TodoRemainder> _loadReminders() {
    // ver si existen datos TodoRemainder en la box y sacarlos como Lista (no es necesario hacer get ni put)
    // debe haber un adapter para que la BD pueda detectar el objeto
    if(remainderBox.isEmpty) {
      throw EmptyDatabase();
    } else {
      Map<dynamic, dynamic> raw = remainderBox.toMap();
      List list = raw.values.toList();
      List<TodoRemainder> remainderList = list.cast<TodoRemainder>();
      return remainderList;
    }
     
  }

  void _saveTodoReminder(TodoRemainder todoReminder) {
    TodoRemainder newRemainder = todoReminder; //new
      remainderBox.add(newRemainder); //new
  }

  void _removeTodoReminder(int removedAtIndex) {
      remainderBox.deleteAt(removedAtIndex);
  }
}

class DatabaseDoesNotExist implements Exception {}

class EmptyDatabase implements Exception {}
