import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/userprofile/models/user/result_user.dart';
import 'package:flutter_app_day3/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_day3/modules/userprofile/models/user/user.dart';

enum ViewState {
  Loading,
  Done,
}

class UserState with ChangeNotifier {
  // properties
  List<ResultUser> listUser = [];
  ResultUser _currentUser;
  ViewState _state = ViewState.Done;

  // View State
  ViewState get state => _state;

  // Current User
  ResultUser get currentUser => _currentUser;
  set setCurrentUser(ResultUser user) => _currentUser = user;

  UserState() {
    loadData();
  }

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _userDetails() async {
    if (listUser.isEmpty) {
      final response = await http.get(Constants.URL);
      if (response.statusCode == 200) {
        listUser = User.fromJson(jsonDecode(response.body)).results;
      } else {
        throw Exception('Failed to load user');
      }
    }
  }

  Future<void> loadData() async {
    setState(ViewState.Loading);
    listUser = [];
    await _userDetails();
    setState(ViewState.Done);
  }
}
