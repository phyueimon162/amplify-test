class ApiRoute {
  static const String baseUrl = "https://api.nytimes.com/svc/books/v3/";
  static const String apiKey = "f2iQFEpt2hcBtn0pp4fpBTtOGYuVE81f";

  static String getLatestBookRoute(int offset, String bestSellerName) =>
      "lists/{current}/$bestSellerName.json?offset=$offset&api-key=$apiKey";
}
