import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class NoInternetServices {
  static final NoInternetServices _object = NoInternetServices.private();
  factory NoInternetServices() => _object;
  NoInternetServices.private();

  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  static Stream<bool> get connectionstream =>
      NoInternetServices()._streamController.stream;
  bool _isconnected = true;

  Future<void> intalize() async {
    _checkconnectivity();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> a) {
      _checkrealinternet(a);
    });
  }

  Future<void> _checkconnectivity() async {
    final response = await _connectivity.checkConnectivity();
    _checkrealinternet(response);
  }

  Future<void> _checkrealinternet(List<ConnectivityResult> response) async {
    bool hasconnected = false;
    if (response.contains(ConnectivityResult.none)) {
      hasconnected = false;
    } else {
      try {
        final x = await http
            .get(Uri.parse('https://www.google.com'))
            .timeout(const Duration(seconds: 5));
        hasconnected = x.statusCode == 200;
      } catch (_) {
        hasconnected = false;
      }
    }
    if (_isconnected != hasconnected) {
      _isconnected = hasconnected;
      _streamController.add(hasconnected);
    }
  }

  Future<bool> refreshinternet() async {
    try {
      final x = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 5));
      return x.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _streamController.close();
  }
}
