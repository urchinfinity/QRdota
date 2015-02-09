part of main;

//router template


DefaultRouter _getRouter() => new DefaultRouter(
  uriMapping: <String, RequestHandler> {
    /*
    "/": authen,
    "/stats(/.*)?": statistics,
    "/rank(/.*)?": userRank,
    "/ref(/.*)?": referrer,
    
    "/qc": queryCount,
    "/qs": querySignin,
    "/gsc": getStatsCsv,
    "/grc": getRankCsv,
    
    "/s/.*": _static,
    "/tools": dbTools,
    "/rebuild": rebuild,
    "/update": update,
    "/flush": flush,
    "/init": init,
    
     */
  },
  protectRSP: false);

///Loads the static resources
Future _static(HttpConnect connect)
  => connect.server.resourceLoader.load(connect, connect.request.uri.path.substring(2));