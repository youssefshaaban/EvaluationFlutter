import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({
    required this.duration,
  });

  run(VoidCallback action) {
    if (isRunning) _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void cancel() => _timer?.cancel();

  bool get isRunning => _timer?.isActive ?? false;
}
