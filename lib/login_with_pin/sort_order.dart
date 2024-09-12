enum SortOrder {
  ascending,
  descending,
}

extension SortOrderExtension on SortOrder {
  int getDisplayNumber(int index) {
    switch (this) {
      case SortOrder.ascending:
        return index;
      case SortOrder.descending:
        return 9 - index;
      default:
        return index;
    }
  }
}
