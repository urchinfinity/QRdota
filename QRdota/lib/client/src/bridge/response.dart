part of client.bridge;

Future serve(List<List> responses) {
  for (final List response in responses) {
    final String cmd = response[0];
    print('get $cmd');
  }

  //TODO: serve response to corresponding service
  
  return new Future.value();
}

List get _clientInfo {
  final DateTime now = new DateTime.now();
  final List info = [[currentScope, currentRevision, currentPage, lastNotif]];
  return info;
}