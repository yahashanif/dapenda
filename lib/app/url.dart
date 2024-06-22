bool isDev = true;
// https://api-dev-awb.sismedika.online/api/v1
String baseUrl =
    isDev ? 'api-dev-awb.sismedika.online' : 'api-awb.sismedika.online';

Map<String, String> createHeader({
  required String token,
}) {
  return {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

Map<String, String> createHeaderWithoutToken() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
