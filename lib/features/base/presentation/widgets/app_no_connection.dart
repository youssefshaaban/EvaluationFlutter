import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../common/constants/strings.dart';

class AppNoConnection extends StatelessWidget {
  final void Function()? onTap;
  const AppNoConnection({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: context.colorScheme.onTertiary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
                child: Icon(
                  Symbols.refresh,
                  size: 100,
                  color: context.colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Text(
                  LocaleKeys.noNetworkError.tr(),
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
