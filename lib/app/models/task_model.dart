class Task {
  String title;
  bool status;

  Task({
    required this.title,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        status: json['status'] ??
            false, // Provide a default value if status is null
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'status': status,
      };
}
