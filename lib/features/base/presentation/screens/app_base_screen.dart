import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/common/extensions/double_extension.dart';
import 'package:evaluation/features/base/helpers/navigation_bar_items.dart';
import 'package:evaluation/common/injection/base_injection_container.dart';

class AppBaseScreen extends StatefulWidget {
  const AppBaseScreen({super.key});

  static const routeName = './home_base';

  @override
  State<AppBaseScreen> createState() => _AppBaseScreenState();
}

class _AppBaseScreenState extends State<AppBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      var currentTab = ref.watch(currentTabProvider);
      return Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: currentTab.index,
              children: [
                ...NavigationBarTab.values.map((tab) {
                  return tab.page;
                }).toList()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.onTertiary.withOpacity(0.9),
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: context.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ),
                child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      ...NavigationBarTab.values.map((tab) {
                        return BottomNavigationBarItem(
                          icon: _buildIcon(tab.index, tab.icon),
                          label: '',
                        );
                      }).toList()
                    ],
                    currentIndex: currentTab.index,
                    onTap: (ind) {
                      // if (ind == NavigationBarTab.add.index) {
                      //   // Navigator.of(Routes.navigatorKey.currentContext!)
                      //   //     .pushNamed(CartScreen.routeName);
                      // } else {
                      if (ind == currentTab.index) {
                        if (currentTab.onTapPop != null) {
                          currentTab.onTapPop!();
                        }
                      }
                      if (ind == NavigationBarTab.home.index) {
                        // ProviderScope.containerOf(context)
                        //     .read(homeViewModelProvider.notifier)
                        //     .getHomeCategories();
                      }
                      ref
                          .read(currentTabProvider.notifier)
                          .setCurrentIndex(ind);
                      //}
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildIcon(int index, IconData iconData) {
    bool isSelected =
        ProviderScope.containerOf(context).read(currentTabProvider).index ==
            index;

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 17.0.toResponsiveWidth,
              vertical: 9.0.toResponsiveHeight),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.secondaryContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            iconData,
            size: 24.toResponsiveHeight,
          ),
        ),
        // if (index == 2)
        //   Consumer(builder: (_, ref, __) {
        //     int cartCount = ref.watch(cartViewModelProvider).data.items.length;
        //     return Positioned(
        //       top: 8.toResponsiveHeight,
        //       right: 16.toResponsiveWidth,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: context.colorScheme.primary,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         constraints: BoxConstraints(
        //           minWidth: 16,
        //           minHeight: 16,
        //         ),
        //         child: Text(
        //           cartCount.toString(),
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 12,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     );
        //   }),
      ],
    );
  }
}
