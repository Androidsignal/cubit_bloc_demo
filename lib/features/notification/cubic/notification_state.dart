part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel>? notificationList;

  NotificationLoaded(this.notificationList);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationLoaded &&
          runtimeType == other.runtimeType &&
          notificationList == other.notificationList;

  @override
  int get hashCode => notificationList.hashCode;
}

class NotificationError extends NotificationState {
  final String errorMessage;

  NotificationError(this.errorMessage);
}
