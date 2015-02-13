part of main;

//router template


DefaultRouter _getRouter() => new DefaultRouter(
  uriMapping: <String, RequestHandler> {
    "/": home,
    "/m(/.*)?": map,
    "/usr(/.*)?": userProfile,
    "/lat(/.*)?": lattice,
    "/frnds(/.*)?": friendList,
    "/frnd(/.*)?": friend,
    "/items(/.*)?": itemList,
    "/item(/.*)?": item,
    "/stories(/.*)?": storyList,
    "/story(/.*)?": story,
    "/magic(/.*)?": magicbook,
    "/notif(/.*)?": notification,
    "/menu(/.*)?": menu,
    "/setting(/.*)?": setting,
    
    "/q": query,
    
    "/r/login(/)?": login,
    "/r/logout(/)?": app.security.logout,

    "/invite(/)?": invite,
    "/send(/.*)?": send,
  },
  protectRSP: false);

///Loads the static resources
Future _static(HttpConnect connect)
  => connect.server.resourceLoader.load(connect, connect.request.uri.path.substring(2));