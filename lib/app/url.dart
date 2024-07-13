bool isDev = true;
// https://api-dev-awb.sismedika.online/api/v1
String baseUrl = isDev ? 'edapenda.mhmfajar.my.id' : 'api-awb.sismedika.online';

String baseUrlImage =
    'https://edapenda.mhmfajar.my.id/uploads/d-upload-berkas/';

Map<String, String> createHeader({
  required String token,
}) {
  return {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Api-Key': "76D4D15FEBCA5392A57AE7D0C3E35D37",
  };
}

Map<String, String> createHeaderWithoutToken() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Api-Key': "76D4D15FEBCA5392A57AE7D0C3E35D37",
  };
}
