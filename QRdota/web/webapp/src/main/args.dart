part of main;

const String _DEFAULT_DB_URI = 'postgres://postgres:_quire_@localhost:5432/stats';

///The arguments passed to the application.
class Args {
  ///The internet address to listen, or null if not specified.
  final String address;
  ///The internet port, or null if not specified.
  final int port;
  ///The URI of the database.
  final String dbUri;
  ///The maximal allowed size of the connection pool of the database.
  final int poolSize;
  
  Args._(this.address, this.port, this.dbUri, this.poolSize);
}

Args _parseArgs(List<String> arguments) {
  final ArgParser parser = new ArgParser()
    ..addFlag("help", abbr: 'h', negatable: false, help: "Display this message")
    ..addOption("address", help: "Specify the internet address to listen.")
    ..addOption("port", help: "Specify the socket port to listen. Default: 8080")
    ..addOption("db-uri", help: "Specify the URI of the database. Default: $_DEFAULT_DB_URI")
    ..addOption("pool-size", help: "Specify the maximal number of the database connection pool."
                                   " Default: 200");
  var args;
  try {
    args = parser.parse(arguments);
  } on FormatException catch (e) {
    print(e.message);
    return null;
  }

  if (args['help']) {
    print("Usage: dart ${Platform.script.toFilePath()} [<flags>]");
    print("\nOptions:");
    print(parser.usage);
    return null;
  }

  String val = args["port"];
  int port;
  if (val != null) {
    try {
      port = int.parse(val);
    } catch (e) {
      print("Illegal port: $val");
      return null;
    }
  }

  val = args["db-uri"];
  final String dbUri = val != null ? val: _DEFAULT_DB_URI;

  val = args["pool-size"];
  int poolSize = 200;
  if (val != null) {
    try {
      poolSize = int.parse(val);
    } catch (e) {
      print("Illegal pool-size: $val");
      return null;
    }
  }
  
  return new Args._(args["address"], port, dbUri, poolSize);
}
