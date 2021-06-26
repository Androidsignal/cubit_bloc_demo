
import 'package:flutter/material.dart';

import 'gloable.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._internal();


  AppTheme._internal();

  factory AppTheme() {
    return _singleton;
  }

  Color primaryColor = Color(0xFF1312FA);

  Color primaryColorForDarkMode = Colors.black;

  Color _buttonColor = Colors.black;

  Color _scaffoldBackgroundColor = Colors.white;

  Color _errorColor = Colors.redAccent;

  Color _textColor = Colors.black;

  Color _textFieldBackgroundColor = Colors.grey.shade200;

  Color _black = Colors.black;

  Color _white = Colors.white;

  IconThemeData iconTheme(BuildContext context) {
    return IconTheme.of(context).copyWith(color: appTheme.black(context));
  }

  Color black(BuildContext context) {
    return _black;
  }

  Color white(BuildContext context) {
    return _white;
  }

  Color textFieldBackgroundColor(BuildContext context){
    return _textFieldBackgroundColor;
  }

  Color textColor(BuildContext context){
    _textColor = Theme.of(context).textTheme.headline6!.color!;
    return _textColor;
  }

  Color buttonColor(BuildContext context){
    _buttonColor = Theme.of(context).primaryColor;
    return _buttonColor;
  }

  Color backgroundColor(BuildContext context){
    _scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return _scaffoldBackgroundColor;
  }

  Color errorColor(BuildContext context){
    _errorColor = Theme.of(context).errorColor;
    return _errorColor;
  }

}