library client.app_info;

const num _DEFAULT_HEARTBEAT = 1;

class AppInfo {
  ///The build number of the application.
  final String build;
  ///Whether the app is a test or a prodiction version.
  final String version;
  ///The heartbeat frequency.
  final num heartbeat;
  
  AppInfo._(this.build, this.version, this.heartbeat);
  
  factory AppInfo._default() {
    return new AppInfo._('0', '0.0.1', _DEFAULT_HEARTBEAT);
  }
}

final AppInfo appInfo = new AppInfo._default();