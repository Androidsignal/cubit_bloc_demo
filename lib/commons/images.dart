class Images {
  static final Images _singleton = Images._internal();

  Images._internal();

  factory Images() {
    return _singleton;
  }

  var unSelectedHomeIcon = 'images/home_unselected.png';
  var unSelectedSearchIcon = 'images/search_unselected.png';
  var centerMenuIcon = 'images/center_menu.png';
  var notificationSelectedIcon = 'images/notification_selected.png';
}
