import 'package:flutter/material.dart';

final _navKey = GlobalKey<NavigatorState>();

GlobalKey get navKey => _navKey;

pushNamed(String path) {
  _navKey.currentState!.pushNamed(path);
}

replaceNamed(String path) {
  _navKey.currentState!.pushReplacementNamed(path);
}
