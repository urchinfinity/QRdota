library client.bridge;

import "dart:async";
import "dart:html" hide Comment, Notification;
import "dart:convert" show JSON;

Future sendAjax(String uri, json) {
  final Completer<HttpRequest> completer = new Completer();
  final HttpRequest xhr = new HttpRequest();
  xhr
    ..open("POST", uri, async: true)
    ..onLoad.listen((evt) {
      final int status = xhr.status;
      if (status >= 200 && status < 300) {
        final String val = xhr.responseText.trim();
        completer.complete(val.isEmpty ? null: JSON.decode(val));
      } else {
        completer.completeError(status);
      }
    })
    ..onError.listen(completer.completeError)
    ..send(JSON.encode(json));

  return completer.future;
}