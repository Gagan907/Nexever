import 'package:flutter/material.dart';

abstract class CustomChangeNotifier extends ChangeNotifier {

  bool? isLoading = false;
  bool? isError = false;
  String? error = "";

  loading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  setError(String? err) {
    isError = true;
    error = err;
  }
}