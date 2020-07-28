import 'package:bati_turbo_erp/core/locator.dart';
import 'package:bati_turbo_erp/core/services/navigator_service.dart';
import 'package:flutter/material.dart';

abstract class BaseModel with ChangeNotifier {
  final NavigatorService navigatorService = getIt<NavigatorService>();

  bool _busy = false;

  bool get busy => _busy;

  set busy(bool state) {
    _busy = state;

    notifyListeners();
  }
}
