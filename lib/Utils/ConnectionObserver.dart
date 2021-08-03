import 'dart:async';

import 'package:connectivity/connectivity.dart';

//Connectivity status enums
enum ConnectivityStatus { WiFi, Cellular, Offline }

class ConnectionObserver {
  // Create our public controller
  static ConnectionObserver? _connection;

  ConnectionObserver._internal() {
    //initialise value here if needed
  }

  static ConnectionObserver? get instance{
    if(_connection == null){
      _connection = ConnectionObserver._internal();
    }
    return _connection;
  }


  Future<ConnectivityStatus?> checkInternet() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return _getStatusFromResult(result);
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }



}
