import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/features/base/helpers/navigation_bar_items.dart';

class NavigationTabViewModel extends StateNotifier<NavigationBarTab> {
  NavigationTabViewModel() : super(NavigationBarTab.home);

  void setCurrentTab(NavigationBarTab tab) {
    state = tab;
  }

  void setCurrentIndex(int index) {
    setCurrentTab(NavigationBarTab.itemFromIndex(index));
  }
}
