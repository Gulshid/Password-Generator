import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_generator/Model_/pass_model.dart';

class PassViewmodel with ChangeNotifier {
  bool IncludeLowerCase = true;
  bool IncludeUpperCase = true;
  bool IncludeNumber = true;
  bool Includesymbols = false;
  double length = 12;

  PassModel? _password;
  PassModel? get password => _password;

  //set the lower Case value
  void SetLowerCase(bool value) {
    IncludeLowerCase = value;
    notifyListeners();
  }

  //set the Upper Case value
  void SetUpperCase(bool value) {
    IncludeUpperCase = value;
    notifyListeners();
  }

  //set the Numbers value
  void SetNumber(bool value) {
    IncludeNumber = value;
    notifyListeners();
  }

  //set the Symbol value
  void SetSymbol(bool value) {
    Includesymbols = value;
    notifyListeners();
  }

  //set the length
  void SetLength(double len) {
    length = len;
    notifyListeners();
  }

  //function for Generator to generate the Password
  void genrate_password() {
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!<>@#%^&*(-_+=|/?.,~";:{[}])';

    String chars = '';
    if (IncludeLowerCase) {
      chars += lowercase;
    }
    if (IncludeUpperCase) {
      chars += uppercase;
    }
    if (IncludeNumber) {
      chars += numbers;
    }
    if (Includesymbols) {
      chars += symbols;
    }

    if (chars.isEmpty) {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.teal,
        gravity: ToastGravity.BOTTOM,
        msg: 'Select at least one Character set');
      return;
    }

    final random = Random();
    final generated =
        List.generate(
          length.toInt(),
          (index) => chars[random.nextInt(chars.length)],
        ).join();

    _password = PassModel(value: generated);
    notifyListeners();
  }
}
