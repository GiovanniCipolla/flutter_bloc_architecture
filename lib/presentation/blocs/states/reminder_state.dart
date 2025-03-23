// presentation/providers/reminder_state.dart

import 'package:flutter_bloc_architecture/data/models/reminder.dart';

class ReminderState {
  final List<Reminder> reminders;
  final bool isLoading;
  final String? error;

  ReminderState({
    this.reminders = const [],
    this.isLoading = false,
    this.error,
  });

  // Metodo per creare una copia dello stato con valori aggiornati
  ReminderState copyWith({
    List<Reminder>? reminders,
    bool? isLoading,
    String? error,
  }) {
    return ReminderState(
      reminders: reminders ?? this.reminders,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
