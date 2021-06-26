import 'package:bloc_pattern_demo/features/notification/cubic/notification_cubit.dart';
import 'package:bloc_pattern_demo/data/repositories/notification_repository.dart';
import 'package:bloc_pattern_demo/features/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'commons/gloable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(414, 896), builder: () {
      return MaterialApp(
        title: 'Bloc Design Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: appTheme.primaryColor,
          // fontFamily: 'Noir'
        ),
        home: MultiBlocProvider(
            providers: [
              BlocProvider<NotificationCubit>(
                create: (BuildContext context) => NotificationCubit(NotificationApi()),
              ),
            ],
            child: BottomNavigationBarScreen(),
        ),
      );
    });
  }
}
