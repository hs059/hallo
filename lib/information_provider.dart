 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart';
import 'package:yazji_form_sp/shaerd_helper.dart';

import 'details_screen.dart';

class InformationProvider extends ChangeNotifier {
  String username;

  String email;

  bool checkBox = false;

  int groudValueRaido = 1;
  String gender;
  var date;
  savegender() {
    switch (groudValueRaido) {
      case 1:
        this.gender = 'Male';
        break;
      case 2:
        this.gender = 'Feamle';
        break;
      default:
    }
    notifyListeners();
  }

  saveUserName(String value) {
    this.username = value;
    notifyListeners();
  }

  saveEmail(String value) {
    this.email = value;
    notifyListeners();
  }

  validatorName(String value) {
    if (value == null || value == '') {
      return 'Name is requierd';
    } else if (!isAlpha(value)) {
      return 'This field contains only Character';
    }
    notifyListeners();
  }

  validatorEmail(String value) {
    if (value == null || value == '') {
      return 'Email is requierd';
    } else if (!isEmail(value)) {
      return 'invaled email syntax';
    }
    notifyListeners();
  }

  onSubmit(GlobalKey<FormState> _keyForm, BuildContext context) {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();

      print(gender);

      SharedHelper.sHelper.setValue(true);

      SharedHelper.sHelper
          .setInformationUser(username, email, gender, date.toString());

      // ExtendedNavigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => DetailsScreen()));

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => DetailsScreen()));

      print(username);
    } else {
      print('error');
    }
    notifyListeners();
  }
}
