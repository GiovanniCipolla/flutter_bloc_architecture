import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/data/models/reminder.dart';
import 'package:flutter_bloc_architecture/data/repositories/reminder_repository.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/states/reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  final ReminderRepository reminderRepository;
  ReminderCubit(this.reminderRepository) : super(ReminderState());

  // Metodo per aggiungere un promemoria
  void addReminder(Reminder reminder) {
    // Copia lo stato corrente e aggiunge il nuovo promemoria
    emit(state.copyWith(reminders: [...state.reminders, reminder]));
  }

  // Metodo per rimuovere un promemoria
  void removeReminder(String id) {
    // Filtra la lista per rimuovere il promemoria con l'ID specificato
    final updatedReminders =
        state.reminders.where((reminder) => reminder.id != id).toList();
    emit(state.copyWith(reminders: updatedReminders));
  }

  // Metodo per impostare lo stato di caricamento
  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  // Metodo per impostare un errore
  void setError(String error) {
    emit(state.copyWith(error: error));
  }

  // Metodo per cancellare l'errore
  void clearError() {
    emit(state.copyWith(error: null));
  }
}
