mixin PaginationUtils {
  int page = 1;
  bool hasNext = true;
  bool isPerformingRequest = false;
  reset() {
    page = 1;
    hasNext = true;
  }

  checkHasNext(List li, {int limit = 10}) {
    hasNext = li.isNotEmpty && li.length >= limit;
  }

  checkPerformRequest({bool refresh = false}) {
    return isPerformingRequest || !(refresh || hasNext);
  }
}
