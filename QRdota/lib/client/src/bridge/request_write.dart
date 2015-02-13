part of client.bridge;

void startHeartbeat([num seconds]) {
  if (_heartbeatTimer != null) {
    _heartbeatTimer.cancel();
    _heartbeatTimer = null;
  }
  
  if (seconds == null) 
    seconds = appInfo.heartbeat;
  
  if (seconds > 0) {
    _heartbeatTimer = new Timer.periodic(
        new Duration(seconds: seconds.toInt()), _hbeat);
  }
}

void _hbeat([_]) {
  //TODO: add default quqery
  _wrStart();
}

Future _wrStart() {
  _wrQueSending = _wrQue;
  _wrQue = [];
  
  final List sendData = [_clientInfo, _wrQueSending];
  final DateTime t0 = new DateTime.now();
  
  //TODO: check if user is online
  return sendAjax("/q", sendData)
    .then((result) {
      if (result is List) {
        return serve(result);
      }
    })
    .catchError((ex, st) {
    //TODO: catch error type and repair
      print('exception: $ex, stackTrace: $st');
    })
    .whenComplete(() {
      _wrQueSending = null;
    });
}

Timer _heartbeatTimer;

class WriteCommand {
  ///The name of the command.
  final String name;
  
  const WriteCommand(this.name);
  
  ///Send commands to server.
  Future send(data) {
    _wrQue.add(new _WriteRequest(this, data));
    //TODO: delay send
    return _wrStart();
  }
  
}

const WriteCommand
  C_CREATE = const WriteCommand(SC_CREATE),
  C_UPDATE = const WriteCommand(SC_UPDATE);

///A write request.
class _WriteRequest {
  final WriteCommand command;
  final data;
  _WriteRequest(this.command, this.data);
  toJson() => [command.name, data];
}

List<_WriteRequest>
  _wrQue = [],
  _wrQueSending;
