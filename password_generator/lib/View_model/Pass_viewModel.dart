import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_generator/Model_/pass_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PassViewmodel with ChangeNotifier {
  bool IncludeUpperCase = true;
  bool IncludeLowerCase = true;
  bool IncludeNumber = true;
  bool IncludeSymbols = false;
  double length = 12;

  PassModel? _password;
  PassModel? get password => _password;

  //Set the Upper Case values
  void SetUpperCase(bool value) {
    IncludeUpperCase = value;
    notifyListeners();
  }

  //Set the Lower Case values
  void SetLowerCase(bool value) {
    IncludeLowerCase = value;
    notifyListeners();
  }

  //Set the Number values
  void SetNumber(bool value) {
    IncludeNumber = value;
    notifyListeners();
  }

  //Set the Symbols values
  void SetSymbols(bool values) {
    IncludeSymbols = values;
    notifyListeners();
  }

  //Set the length of Password
  void SetLength(double len) {
    length = len;
    notifyListeners();
  }

  //function for Generator to generate the Password
  void generate_password() {
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#%^&*()[]';

    String pass = '';
    if (IncludeUpperCase) {
      pass += uppercase;
    }
    if (IncludeLowerCase) {
      pass += lowercase;
    }
    if (IncludeNumber) {
      pass += numbers;
    }
    if (IncludeSymbols) {
      pass += symbols;
    }

    if (pass.isEmpty) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.teal,
        msg: 'Select at least one of them',
      );
      return;
    }

    final random = Random();
    final generated =
        List.generate(
          length.toInt(),
          (index) => pass[random.nextInt(pass.length)],
        ).join();

    _password = PassModel(value: generated);
    notifyListeners();
  }
}
