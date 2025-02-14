import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/network_manager/api_methods_impl.dart';
import 'package:evaluation/features/base/data/data_source/base_locale_data_source.dart';
import 'package:evaluation/features/base/helpers/navigation_bar_items.dart';
import 'package:evaluation/features/base/presentation/view_models/navigation_page_view_model.dart';
import 'package:evaluation/features/base/presentation/view_models/network_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiMethodProvider = Provider<ApiMethodsImpl>((ref) => ApiMethodsImpl());

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final isConnectedProvider =
    StateNotifierProvider<NetworkViewModel, bool>((ref) {
  return NetworkViewModel();
});

final baseLocalDataSourceProvider = Provider<BaseLocaleDataSource>((ref) {
  return BaseLocaleDataSource(ref.read(sharedPreferencesProvider));
});

final currentTabProvider =
    StateNotifierProvider<NavigationTabViewModel, NavigationBarTab>((ref) {
  return NavigationTabViewModel();
});
