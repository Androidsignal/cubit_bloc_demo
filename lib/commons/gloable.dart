import 'package:bloc_pattern_demo/commons/images.dart';
import 'package:bloc_pattern_demo/commons/theme.dart';
import 'package:bloc_pattern_demo/strings/en.dart';
import 'package:bloc_pattern_demo/strings/strings.dart';
import 'package:flutter/material.dart';


AppTheme appTheme = AppTheme();
Images images = Images();
EnglishStrings en = EnglishStrings();

StringKeys stringKeys = StringKeys();

getText(String key){
  return en.map()[key]??'???';
}

showMsg(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}