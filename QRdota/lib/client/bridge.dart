library client.bridge;

import "dart:async";
import "dart:html" hide Comment, Notification;
import "dart:convert" show JSON;

import "app_info.dart" show appInfo;
import "util.dart";
import "../generic/command.dart";

part "src/bridge/request_write.dart";
part "src/bridge/response.dart";

///The current revision of the game (never null).
int currentRevision;
///The current scope (i.e. user id).
String currentScope;
///The current page of the game, used to retrieve data periodically.
String currentPage;
///Datetime of last retrieved notification.
DateTime lastNotif;


