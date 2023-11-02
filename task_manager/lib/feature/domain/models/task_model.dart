class TaskModel {
  String? id;
  bool? isActive;
  String? title;
  String? text;

  TaskModel({
    this.id,
    this.isActive,
    this.title,
    this.text,
  });

  TaskModel copyWith({
    String? id,
    bool? isActive,
    String? title,
    String? text,
  }) {
    return TaskModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      title: title ?? this.title,
      text: text ?? this.text,
    );
  }

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'isActive': isActive,
      'title': title,
      'text': text,
    };
    return data;
  }
}
