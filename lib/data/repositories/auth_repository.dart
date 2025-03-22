import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/core/api_client.dart';
import 'package:flutter_bloc_architecture/core/costants.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(
    this._apiClient,
  ); // ApiClient viene passato tramite il costruttore

  /// Effettua il login e restituisce il token di autenticazione
  Future<String> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        Constants.loginEndpoint,
        data: {'email': email, 'password': password},
      );

      // Estrai il token dalla risposta
      final token = response.data['token'] as String;
      return token;
    } on DioException catch (e) {
      // Gestisci gli errori di rete o del server
      if (e.response != null) {
        throw Exception(
          'Errore durante il login: ${e.response!.data['message']}',
        );
      } else {
        throw Exception('Errore di connessione: ${e.message}');
      }
    }
  }

  /// Effettua il logout (opzionale)
  Future<void> logout() async {
    try {
      // await _apiClient.dio.post(Constants.logoutEndpoint);
    } on DioException catch (e) {
      throw Exception('Errore durante il logout: ${e.message}');
    }
  }
}
