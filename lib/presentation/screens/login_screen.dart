import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/blocs/auth_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/events/auth_event.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/states/auth_state.dart';

// Differenza tra BlocBuilder e BlocConsumer
// 📌 Quando usare uno o l’altro?
// ✔ Se vuoi solo aggiornare la UI → BlocBuilder
// ✔ Se devi anche eseguire azioni una tantum (es. navigazione, snackbar) → BlocConsumer

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // BlocConsumer per gestire lo stato e la navigazione
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.isLoggedIn) {
                  // Navigazione quando l'utente è loggato
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                } else if (state.isLoggedIn == false) {
                  // Mostra un errore se il login fallisce
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Errore")));
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed:
                      false
                          ? null // Disabilita il pulsante durante il caricamento
                          : () {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            context.read<AuthBloc>().add(
                              LoginEvent(email, password),
                            );
                          },
                  child:
                      false
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
