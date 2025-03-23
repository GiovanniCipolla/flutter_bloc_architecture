// data/repositories/reminder_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/core/api_client.dart';
import 'package:flutter_bloc_architecture/core/costants.dart';
import 'package:flutter_bloc_architecture/data/models/reminder.dart';

class ReminderRepository {
  final ApiClient _apiClient;

  ReminderRepository(this._apiClient);

  Future<List<Reminder>> getReminders() async {
    try {
      final response = await _apiClient.dio.get(Constants.remindersEndpoint);
      return (response.data as List)
          .map((item) => Reminder.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        'Errore durante il recupero dei promemoria: ${e.message}',
      );
    }
  }

  Future<Reminder> addReminder(Reminder reminder) async {
    try {
      final response = await _apiClient.dio.post(
        Constants.remindersEndpoint,
        data: reminder.toJson(),
      );
      return Reminder.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        'Errore durante l\'aggiunta del promemoria: ${e.message}',
      );
    }
  }

  Future<void> deleteReminder(int id) async {
    try {
      await _apiClient.dio.delete('${Constants.remindersEndpoint}/$id');
    } on DioException catch (e) {
      throw Exception(
        'Errore durante l\'eliminazione del promemoria: ${e.message}',
      );
    }
  }
}
