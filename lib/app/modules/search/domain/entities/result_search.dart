class ResultSearch {
  final String temperature;
  final String wind;
  final String description;
  final List<ResultSearch> forecast;
  final String day;

  ResultSearch({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
    required this.day,
  });
}
