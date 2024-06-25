import 'package:flutter/foundation.dart';

extension LoggerExtension<T> on T {
  void logger() {
    if (kDebugMode) {
      print('XULU-LOGGER-EXTENSION => $this');
    }
  }
}
