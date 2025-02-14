import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/common/extensions/double_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/constants/strings.dart';
import '../../../../common/extensions/widget_extensions.dart';

class AppNoData extends StatelessWidget {
  final Function refreshTriggered;

  const AppNoData({
    required this.refreshTriggered,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshTriggered();
      },
      child: Container(
        height: 100.h,
        width: 100.w,
        color: context.colorScheme.onTertiary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 100,
                ),
                Text(
                  LocaleKeys.noDataError.tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge,
                ).paddingVertical(1.h),
                Text(
                  LocaleKeys.tryAgainDataError.tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge,
                ).paddingVertical(1.h),
                SizedBox(
                  height: 50.toResponsiveHeight,
                ),
                AppPrimaryButton(
                  title: LocaleKeys.tryAgain.tr(),
                  onPressed: () {
                    refreshTriggered();
                  },
                ).paddingHorizontal(25.toResponsiveWidth)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
