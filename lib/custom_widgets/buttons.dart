
import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:bloc_pattern_demo/custom_widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class RaisedBtn extends StatefulWidget {
  final GestureTapCallback onClick;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final double? padding;

  RaisedBtn({
    Key? key,
    required this.onClick,
    this.text,
    this.color,
    this.textColor,
    this.elevation,
    this.padding,
  }) : super(key: key);

  @override
  _RaisedBtnState createState() => _RaisedBtnState();
}

class _RaisedBtnState extends State<RaisedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: widget.color ?? appTheme.buttonColor(context),
          elevation: widget.elevation ?? 10,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25.r)
         )
      ),
      onPressed: widget.onClick,
      child: Padding(
        padding: EdgeInsets.all(widget.padding ?? 15.r),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
          child: Text(
            widget.text ?? '',
          ),
        ),
      ),
    );
  }
}

class CustomRaisedBtn extends StatefulWidget {
  final GestureTapCallback onClick;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final double? padding;

  CustomRaisedBtn({
    Key? key,
    required this.onClick,
    this.child,
    this.color,
    this.textColor,
    this.elevation,
    this.padding,
  }) : super(key: key);

  @override
  _CustomRaisedBtnState createState() => _CustomRaisedBtnState();
}

class _CustomRaisedBtnState extends State<CustomRaisedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: widget.color ?? appTheme.buttonColor(context),
          elevation: widget.elevation ?? 10,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25.r)
         )
      ),
      onPressed: widget.onClick,
      child: Padding(
        padding: EdgeInsets.all(widget.padding ?? 15.r),
        child: widget.child??Container(),
      ),
    );
  }
}

class FlatBtn extends StatefulWidget {
  final GestureTapCallback onClick;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final double? padding;
  final double? fontSize;

  FlatBtn({
    Key? key,
    required this.onClick,
    this.text,
    this.color,
    this.textColor,
    this.elevation,
    this.padding, this.fontSize,
  }) : super(key: key);

  @override
  _FlatBtnState createState() => _FlatBtnState();
}

class _FlatBtnState extends State<FlatBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Padding(
        padding: EdgeInsets.all(widget.padding??20.r),
        child: Body2Text(text: widget.text??'',alignment: TextAlign.center,),
      ),
    );
    /*return TextButton(
      onPressed: widget.onClick,
      child: Padding(
        padding: EdgeInsets.all(widget.padding ?? 15.r),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
          child: Text(
            widget.text ?? '',
            style: TextStyle(color: widget.textColor,fontSize: widget.fontSize),
          ),
        ),
      ),
    );*/
  }
}

