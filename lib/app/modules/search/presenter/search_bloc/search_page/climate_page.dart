class ClimateController {
  String getImage(String value) {
    if (value.contains('rain')) {
      return r'assets/day/rain.png';
    }
    if (value.contains('cloudy')) {
      return r'assets/day/cloudy.png';
    }
    if (value.contains('Sunny')) {
      return r'assets/day/sun.png';
    }
    return r'assets/day/sun.png';
  }
}
