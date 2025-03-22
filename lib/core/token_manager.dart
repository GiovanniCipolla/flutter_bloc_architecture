import 'package:flutter_bloc_architecture/data/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static final _storage = FlutterSecureStorage();
  static Token? _token;

  static Future<Token?> getToken() async {
    if (_token != null) {
      return _token;
    }

    final accessToken = await _storage.read(key: 'accessToken');
    final refreshToken = await _storage.read(key: 'refreshToken');

    if (accessToken != null && refreshToken != null) {
      _token = Token(accessToken: accessToken, refreshToken: refreshToken);
      return _token;
    }

    return null;
  }

  static Future<void> setToken(Token token) async {
    _token = token;

    await _storage.write(key: 'accessToken', value: token.accessToken);
    await _storage.write(key: 'refreshToken', value: token.refreshToken);
  }

  static Future<void> clearToken() async {
    _token = null;
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
  }
}
