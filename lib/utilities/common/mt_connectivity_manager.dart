/// Uncomment below lines for connectivity plugin usage.
/// This file is used to check internet connection state and get notified on connection change
///
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
//
// class MTConnectivityManager with ChangeNotifier {
//   bool? _isOnline;
//
//   bool get isOnline => _isOnline ?? false;
//
//   Future<bool> checkConnectivity() async {
//     if (_isOnline == null) {
//       final event = await Connectivity().checkConnectivity();
//       return (event != ConnectivityResult.none);
//     } else {
//       return _isOnline!;
//     }
//   }
//
//   MTConnectivityManager() {
//     checkConnectivity();
//     Connectivity _connectivity = Connectivity();
//     _connectivity.onConnectivityChanged.listen(
//       _updateConnectivity,
//     );
//   }
//
//   _updateConnectivity(ConnectivityResult event) {
//     _isOnline = event != ConnectivityResult.none;
//     notifyListeners();
//   }
// }
