class BaseState<T> {
  bool isLoading;
  String? successMessage;
  bool hasNoConnection;
  bool hasNoData;
  T data;

  BaseState(
      {this.isLoading = false,
      this.successMessage,
      this.hasNoConnection = false,
      this.hasNoData = false,
      required this.data});

  BaseState<T> copyWith(
      {bool? isLoading,
      String? successMessage,
      bool? hasNoConnection,
      bool? hasNoData,
      T? data}) {
    return BaseState(
        isLoading: isLoading ?? this.isLoading,
        successMessage: successMessage ?? this.successMessage,
        hasNoConnection: hasNoConnection ?? this.hasNoConnection,
        hasNoData: hasNoData ?? this.hasNoData,
        data: data ?? this.data);
  }
}
