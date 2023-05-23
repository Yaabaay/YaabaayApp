import 'dart:io' show Platform;

Future<String> getDevicePlatform() async {
  if(Platform.isIOS){
    return 'ios';
  }else if(Platform.isAndroid){
    return 'android';
  }else if(Platform.isMacOS){
    return 'mac';
  }else if(Platform.isWindows){
    return 'windows';
  }else if(Platform.isFuchsia){
    return 'fuchsia';
  }else if(Platform.isLinux){
    return 'linux';
  }else{
    return 'undefined';
  }
}