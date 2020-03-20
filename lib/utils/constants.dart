class Constants {
  static String TOP_HEADLINE_URL =
      "http://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=27aafa002a324c3fb9d80fe2f2c69977";
  static String headlinesFor(String keyword) {
    return "http://newsapi.org/v2/everything?q=$keyword&apiKey=27aafa002a324c3fb9d80fe2f2c69977";
  }
}
