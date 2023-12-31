class Level {
  String? question;
  int? solution;

  Level({this.question, this.solution});

  Level.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    solution = json['solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['solution'] = this.solution;
    return data;
  }
}