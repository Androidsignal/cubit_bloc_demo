import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body1Text extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final num? fontSize;
  final num? maxLine;
  final TextAlign? textAlign;
  final bool? primary;
  final bool? accent;

  const Body1Text({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.textAlign, this.primary, this.accent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1;
    if(primary??false){
      style = Theme.of(context).primaryTextTheme.bodyText1;
    }else if(accent??false){
      style = Theme.of(context).accentTextTheme.bodyText1;
    }
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: style!.copyWith(
              color: textColor,
              fontSize: fontSize?.toDouble() ?? 16.sp,
            ),
        maxLines: maxLine?.toInt(),
        textAlign: textAlign,
      ),
    );
  }
}

class Body2Text extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final num? maxLine;
  final TextAlign? alignment;

  const Body2Text({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: textColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: FontWeight.bold),
        maxLines: maxLine?.toInt(),
        textAlign: alignment,
      ),
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final num? fontSize;
  final num? maxLine;
  final TextAlign? textAlign;

  const SubTitleText({
    Key? key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: textColor,
            fontSize: fontSize?.toDouble() ?? 20.sp,
            fontWeight: FontWeight.w500,
        ),
        maxLines: maxLine?.toInt(),
        textAlign: textAlign,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final num? fontSize;
  final num? maxLine;
  final TextAlign? textAlign;

  const TitleText({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: textColor,
            fontSize: fontSize?.toDouble() ?? 24.sp,
            fontWeight: FontWeight.w500),
        maxLines: maxLine?.toInt(),
        textAlign: textAlign,
      ),
    );
  }
}
