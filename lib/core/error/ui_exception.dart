class UiException implements Exception {
  final int? code;
  final String title;
  final String description;

  const UiException({
    this.code,
    required this.title,
    required this.description,
  });

  @override
  String toString() => code == null ? title : '$title (код $code)';
}
