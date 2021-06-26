import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:bloc_pattern_demo/custom_widgets/text_utils.dart';
import 'package:bloc_pattern_demo/data/models/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'cubic/notification_cubit.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    var state = context.read<NotificationCubit>().state;
    if (state is NotificationLoaded) {
      var list = getMapList(state.notificationList ?? []);
      return ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 22.h),
        itemBuilder: (context, index) {
          var map = list[index];
          var listOfModel = map['data'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical:15.h),
                child: SubTitleText(
                  text: formatDate(map['date'], [d, ' ', M, ' ', yy]),
                ),
              ),
              Column(
                children: List.generate(listOfModel.length ?? 0, (i) {
                  NotificationModel model = listOfModel[i];
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 4.h,
                                  blurRadius: 20.r,
                                  offset: Offset(
                                    5.w, // Move to right 10  horizontally
                                    7.h, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(80.r),
                            ),
                            child: Container(
                              constraints: BoxConstraints(minHeight: 72.h,maxHeight: 150.h),
                              padding: EdgeInsets.all(8.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect(
                                    child:CachedNetworkImage(
                                      imageUrl: model.imageUrl ?? '',
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                      height: 50.h,
                                      width: 50.h,
                                    ),
                                    /*child: Image.network(
                                      model.imageUrl ?? '',
                                      height: 60.h,
                                      width: 60.h,
                                    ),*/
                                    borderRadius: BorderRadius.circular(80.r),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Body1Text(
                                      text: model.content,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Body1Text(
                                    text: timeago
                                        .format(DateTime.parse(model.date)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20.r),
                          height: 15.r,
                          width: 15.r,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appTheme.primaryColor),
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          );
        },
      );
    }
    return Container();
  }

  List getMapList(List<NotificationModel> notificationList) {
    var dateList = notificationList
        .map((e) {
          var strDate = e.date;
          if (strDate.isNotEmpty) {
            return formatDateYYYYMMDD(strDate);
          }
          return '';
        })
        .toSet()
        .toList();
    List mapList = [];
    dateList.forEach((element) {
      mapList.add(
        {
          'date': DateTime.parse(element),
          'data': notificationList.where((e) => formatDateYYYYMMDD(e.date) == element).toList(),
        },
      );
    });
    return mapList;
  }
  formatDateYYYYMMDD(strDate){
    return formatDate(DateTime.parse(strDate), [yyyy, '-', mm, '-', dd]);
  }
}
