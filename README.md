Progetto Flutter con BLoC

Descrizione del Progetto

Questo progetto è un esempio di architettura Flutter basata su BLoC (Business Logic Component), un pattern per gestire lo stato in modo dichiarativo e reattivo. L’obiettivo è dimostrare come organizzare un’app Flutter in modo modulare e scalabile, con un focus sulla gestione dello stato, la separazione delle responsabilità e l’integrazione con un backend tramite Dio per le chiamate HTTP.

L’app include:
	•	Una schermata di login con autenticazione tramite API.
	•	Gestione dello stato tramite BLoC e Cubit.
	•	Navigazione tra schermate basata sullo stato di autenticazione.
	•	Una struttura di cartelle ben organizzata (core, data, domain, presentation).

Struttura del Progetto

Ecco una panoramica della struttura delle cartelle:
lib/
├── app/                # Configurazione iniziale e avvio dell'app
├── core/               # Codice condiviso e riutilizzabile
│   ├── constants.dart  # Costanti dell'app
│   ├── api_client.dart # Gestione delle chiamate HTTP con Dio
│   └── token_manager.dart # Gestione del token di autenticazione
├── data/               # Gestione dei dati
│   ├── models/         # Modelli di dati (DTO)
│   ├── repositories/   # Repository per accedere ai dati
│   └── datasources/    # Sorgenti di dati (API, database)
├── domain/             # Logica di business
│   ├── entities/       # Entità del dominio
│   ├── repositories/   # Interfacce dei repository
│   └── usecases/       # Casi d'uso
├── presentation/       # Interfaccia utente e gestione dello stato
│   ├── blocs/          # BLoC e Cubit per la gestione dello stato
│   ├── screens/        # Schermate dell'app
│   └── widgets/        # Componenti UI riutilizzabili
└── main.dart           # Punto di ingresso dell'app

Gestione dello Stato con BLoC

Cos’è il BLoC (Business Logic Component)?

BLoC è un pattern di gestione dello stato che separa la logica di business dalla UI. In un’app Flutter, BLoC aiuta a centralizzare la gestione dello stato, in modo che la UI possa rimanere reattiva e indipendente dalla logica. Questo pattern si basa sull’uso di Stream per comunicare tra la logica di business (BLoC) e la UI, assicurando un flusso unidirezionale di dati.

Concetti principali del BLoC:
	1.	Eventi: Azioni che innescano un cambiamento di stato. Ogni volta che l’utente interagisce con l’app (ad esempio, premendo un pulsante), viene inviato un evento.
	2.	Stati: Rappresentano la UI dell’applicazione, che cambia in risposta agli eventi.
	3.	BLoC: Gestisce gli eventi e mappa i cambiamenti nello stato, facendo sì che la UI venga aggiornata di conseguenza.

Cos’è Cubit?

Cubit è una versione semplificata del BLoC che non utilizza eventi. Invece di emettere eventi per modificare lo stato, si usano metodi diretti per aggiornare lo stato. È utile per casi di utilizzo semplici o quando non è necessaria la complessità del BLoC completo.

Come funziona BLoC con Flutter?

In Flutter, i widget si abbonano (ascoltano) agli stati emessi dal BLoC e ricostruiscono la UI ogni volta che lo stato cambia. Questo è possibile grazie ai widget BlocBuilder e BlocConsumer.

Tipi di Widget per Ascoltare il BLoC
	•	BlocBuilder: Un widget che ricostruisce la UI quando lo stato cambia. Si usa quando vuoi solo aggiornare la UI in risposta ai cambiamenti di stato.
	•	BlocConsumer: Combina la funzionalità di BlocBuilder con una logica che esegue azioni una tantum quando lo stato cambia. Ad esempio, si può usare per navigare o mostrare notifiche (come SnackBar).
	•	BlocListener: Ascolta i cambiamenti di stato per eseguire azioni una tantum, ma senza costruire la UI.

Esempi di Utilizzo di BLoC

Gestione dell’autenticazione:

Gestiamo l’autenticazione usando il BLoC. Quando l’utente si autentica o si disconnette, il BLoC emette un nuovo stato che aggiorna la UI.

Gestione delle chiamate API:

Utilizziamo il Cubit o il BLoC per inviare richieste API e aggiornare lo stato della UI con le risposte o gli errori.

Integrazione con Dio per le Chiamate HTTP

Il progetto utilizza Dio, un potente client HTTP per Dart, per gestire le chiamate API. Dio offre funzionalità avanzate come:
	•	Intercettori per aggiungere automaticamente il token di autenticazione agli header.
	•	Gestione del timeout e delle risposte di errore.
	•	Supporto per la cancellazione delle richieste.
	•	Configurazione personalizzata delle opzioni di richiesta.

Dio è integrato nel progetto tramite la classe ApiClient, che centralizza la configurazione delle chiamate HTTP e gestisce l’aggiunta automatica del token di autenticazione.

Altri Pattern per la Gestione dello Stato in Flutter

Oltre a BLoC e Cubit, ci sono altre opzioni per la gestione dello stato in Flutter:
	•	Provider: Una libreria più semplice per la gestione dello stato, ma meno potente rispetto a BLoC.
	•	Riverpod: Una libreria più moderna e flessibile rispetto a Provider.
	•	GetX: Una libreria che integra la gestione dello stato, la navigazione e la gestione delle dipendenze.

Consigli per Espandere il Progetto
	•	Aggiungi Test: Scrivi test unitari e di integrazione per i BLoC, i Cubit e i repository.
	•	Integra un Backend Reale: Sostituisci le chiamate mockate con un backend reale utilizzando Dio.
	•	Aggiungi Gestione degli Errori: Implementa una gestione degli errori robusta per le chiamate API.
	•	Ottimizza il Performance: Considera l’uso di BlocListener o BlocSelector per migliorare le performance.
	•	Aggiungi Animazioni: Migliora l’esperienza utente con animazioni e transizioni fluide.

Come Contribuire

Se vuoi contribuire al progetto, segui questi passi:
	1.	Fai un fork del repository.
	2.	Crea un nuovo branch (git checkout -b feature/nuova-funzionalità).
	3.	Fai commit delle tue modifiche (git commit -m ‘Aggiunta nuova funzionalità’).
	4.	Pusha il branch (git push origin feature/nuova-funzionalità).
	5.	Apri una Pull Request.

Contatti

Per qualsiasi domanda, suggerimento o feedback, non esitare a contattarmi all’indirizzo email:
📧 yayacipolla@icloud.com