class UrlConst {
  static const String betaApiVersion = '';
  static const String productionServerUrl = '';
  static const String testApiVersion = 'https://stackfood-admin.6amtech.com/';
  static const String apiVersion = 'api/v1';

  static const String baseUrl = '$testApiVersion$apiVersion';

  // Endpoints
  static const String settings = '$baseUrl/config';
  static const String banners = '$baseUrl/banners';
  static const String categories = '$baseUrl/categories';
  static const String popularFood = '$baseUrl/products/popular';
  static const String foodCampaign = '$baseUrl/campaigns/item';
  static const String restaurants = '$baseUrl/restaurants/get-restaurants/all?offset=1&limit=10';

}
