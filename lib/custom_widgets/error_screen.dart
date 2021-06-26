
import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:bloc_pattern_demo/custom_widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.error_outline,size: 100.h,color: appTheme.errorColor(context),),
          SizedBox(height: 20.h),
          TitleText(text: getText(stringKeys.errorTitle),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
