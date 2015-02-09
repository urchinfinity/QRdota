library main;

import 'dart:async';
import "dart:io" show Platform;

import "package:args/args.dart" show ArgParser;
//import 'package:path/path.dart' as Path;

import "package:stream/stream.dart";
import "package:stream/plugin.dart" show Router, DefaultRouter;
import "package:access/access.dart" show initAccess, endAccess;
//import "package:stats/server/serve_query.dart";
//import "package:stats/server/serve_signin.dart";
//import "package:stats/server/serve_db.dart";
//import "authen/authen.dart";
//import "db/db.dart";
//import "rank/rank.dart";
//import "referrer/referrer.dart";
//import "statistics/statistics.dart";

part "src/main/args.dart";
part "src/main/router.dart";

void main(List<String> arguments) {
  final Args args = _parseArgs(arguments);
  if (args == null)
    return;
  initAccess(args.dbUri)
  .then((_) => new StreamServer.router(_getRouter(), homeDir: "client").start());
}