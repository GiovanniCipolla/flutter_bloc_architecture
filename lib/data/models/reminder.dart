class Reminder {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  Reminder({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}
