import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class SpotifyApiService {
  final String clientId = SpotifyConfig.clientId;
  final String clientSecret = SpotifyConfig.clientSecret;
  String? accessToken;


  Future<void> authenticate() async {
    const String url = 'https://accounts.spotify.com/api/token';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      accessToken = data['access_token'];
    } else {
      throw Exception('Failed to authenticate with Spotify');
    }
  }

  Future<List<Map<String, dynamic>>> searchItems(String query, String type) async {
    if (accessToken == null) {
      await authenticate();
    }

    final String url =
        'https://api.spotify.com/v1/search?q=$query&type=$type&limit=10';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (type == 'album') {
        return List<Map<String, dynamic>>.from(data['albums']['items']);
      } else if (type == 'artist') {
        return List<Map<String, dynamic>>.from(data['artists']['items']);
      }
    } else {
      throw Exception('Failed to fetch data from Spotify API');
    }
    return [];
  }
}
