import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:bloc_pattern_demo/custom_widgets/app_bar.dart';
import 'package:bloc_pattern_demo/custom_widgets/buttons.dart';
import 'package:bloc_pattern_demo/custom_widgets/text_utils.dart';
import 'package:bloc_pattern_demo/features/notification/cubic/notification_cubit.dart';
import 'package:bloc_pattern_demo/features/notification/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => getRecords());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getText(stringKeys.notifications),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: CustomRaisedBtn(
              padding: 0,
              onClick: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5.w),
                  Body1Text(
                    text: '11',
                    primary: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoaded) {
            return NotificationList();
          }else if (state is NotificationError) {
            return Center(
              child: Body1Text(
                text: state.errorMessage,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  getRecords(){
    final cubit = context.read<NotificationCubit>();
    cubit.getNotifications();
  }
}
