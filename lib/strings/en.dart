
import 'package:bloc_pattern_demo/commons/gloable.dart';

class EnglishStrings{
  static final EnglishStrings _singleton = EnglishStrings._internal();

  EnglishStrings._internal();

  factory EnglishStrings() {
    return _singleton;
  }

  map(){
    return {
      stringKeys.appName : 'Boom',
      stringKeys.continueBtn : 'Continue',
      stringKeys.upload : 'Upload',
      stringKeys.image : 'Image',
      stringKeys.capture : 'Capture',
      stringKeys.pickFromFileManager : 'Pick from file manager',
      stringKeys.cancel : 'Cancel',
      stringKeys.errorTitle : 'Oops!\n Something went wrong, Try again later.',
      stringKeys.save : 'Save',
      stringKeys.finish : 'Finish',
      stringKeys.requestTimeOut : 'Request Timeout',
      stringKeys.errorMsg : 'An unknown error occurred.\nIf problem persists, restart application.',
      stringKeys.home : 'Home',
      stringKeys.notifications : 'Notifications',
    };
  }

}