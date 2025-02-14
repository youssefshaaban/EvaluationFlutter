import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/features/base/data/helpers/base_state.dart';
import 'package:evaluation/features/base/presentation/view_models/base_view_model.dart';
import 'package:evaluation/features/base/presentation/widgets/app_loader.dart';
import 'package:evaluation/features/base/presentation/widgets/app_no_connection.dart';
import 'package:evaluation/features/base/presentation/widgets/app_no_data.dart';
import '../../../../common/injection/injection_container.dart' as di;
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenHandler extends StatefulWidget {
  final StateNotifierProvider<dynamic, BaseState<dynamic>> screenProvider;
  final void Function()? onDeviceReconnected;
  final bool? showLoading;
  final double? height;

  const ScreenHandler({
    super.key,
    required this.screenProvider,
    this.height,
    this.onDeviceReconnected,
    this.showLoading = true,
  });

  @override
  ScreenHandlerState createState() {
    return ScreenHandlerState();
  }
}

class ScreenHandlerState extends State<ScreenHandler> with BaseViewModel {
  bool isConnectedAtLastTime = true;

  late final _isLoadingProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).isLoading;
  });
  late final Provider<bool> _noConnectionProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoConnection;
  });

  late final Provider<bool> _noDataProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoData;
  });

  late final _isReconnectedProvider = Provider<bool>((ref) {
    bool isConnected = ref.watch(di.isConnectedProvider);
    if (isConnected &&
        !isConnectedAtLastTime &&
        widget.onDeviceReconnected != null) {
      Future.delayed(Duration.zero, () {
        widget.onDeviceReconnected!();
      });
    }
    isConnectedAtLastTime = isConnected;
    return isConnected;
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: widget.height ?? 100.h,
      child: Stack(
        children: [
          Consumer(
            builder: (_, ref, __) {
              final bool noData = ref.watch(_noDataProvider);
              return noData
                  ? AppNoData(
                      refreshTriggered: () {
                        noDataRefreshTriggered();
                      },
                    )
                  : const SizedBox();
            },
          ),
          Consumer(
            builder: (_, ref, __) {
              final bool noConnection = ref.watch(_noConnectionProvider);
              print(noConnection);
              ref.watch(_isReconnectedProvider);
              return noConnection
                  ? AppNoConnection(onTap: widget.onDeviceReconnected)
                  : const SizedBox();
            },
          ),
          if (widget.showLoading ?? false)
            Consumer(
              builder: (_, ref, __) {
                final bool isLoading = ref.watch(_isLoadingProvider);
                return isLoading ? const AppLoader() : const SizedBox();
              },
            ),
        ],
      ),
    );
  }

  noDataRefreshTriggered() async {
    Future.delayed(Duration.zero, () {
      widget.onDeviceReconnected!();
    });
  }
}
