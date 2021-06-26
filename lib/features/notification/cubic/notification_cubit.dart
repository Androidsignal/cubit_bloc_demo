import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_demo/data/repositories/notification_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc_pattern_demo/data/models/notification.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _notificationRepository;

  NotificationCubit(this._notificationRepository) : super(NotificationInitial());

  Future<void> getNotifications() async {
    try {
      emit(NotificationLoading());
      final notificationList = await _notificationRepository.getNotifications();
      if (notificationList?.isEmpty ?? false) {
        emit(NotificationError('No data found'));
      } else {
        emit(NotificationLoaded(notificationList));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationCubit &&
          runtimeType == other.runtimeType &&
          _notificationRepository == other._notificationRepository;

  @override
  int get hashCode => _notificationRepository.hashCode;
}
