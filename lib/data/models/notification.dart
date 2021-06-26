class NotificationModel {
  late String id;
  late String date;
  late String? imageUrl;
  late String? color;
  late String content;
  late String notificationType;

  NotificationModel({
    required this.id,
    required this.content,
    required this.notificationType,
    required this.date,
    this.imageUrl,
  });

  NotificationModel.fromMap(Map map) {
    if (map['date'] is String) {
      date = map['date'];
    }
    if (map['imageUrl'] is String) {
      imageUrl = map['imageUrl'];
    }
    if (map['content'] is String) {
      content = map['content'];
    }
    if (map['notificationType'] is String) {
      notificationType = map['notificationType'];
    }
    if (map['color'] is String) {
      color = map['color'];
    }
  }

  toMap() {
    return {
      'date': date,
      'imageUrl': imageUrl,
      'content': content,
      'notificationType': notificationType
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
