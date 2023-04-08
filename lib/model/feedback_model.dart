class FeedbackModel {
  String userId;
  String feedback;

  FeedbackModel({required this.feedback, required this.userId});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      feedback: json['feedback'],
      userId: json['_id'],
    );
  }
}
