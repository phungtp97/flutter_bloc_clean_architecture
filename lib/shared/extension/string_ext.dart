extension TextBuilderExtension on String {
  String shortenText({int limit = 23}) {
    return trim().length > limit
        ? '${trim().substring(0, limit - 3)}...'
        : this;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}