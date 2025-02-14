#!/bin/zsh
flutter pub run easy_localization:generate -S assets/translations -O lib/gen
flutter pub run easy_localization:generate -f keys -S assets/translations -O lib/common/constants -o strings.dart
dart run build_runner build
fluttergen