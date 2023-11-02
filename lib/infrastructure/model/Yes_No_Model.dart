import 'package:app_maybe/domain/entities/message.dart';

class YesOrNot {
  final String answer;
  final bool forced;
  final String image;

  YesOrNot({
    required this.answer,
    required this.forced,
    required this.image,
  });

  YesOrNot copyWith({
    String? answer,
    bool? forced,
    String? image,
  }) =>
      YesOrNot(
        answer: answer ?? this.answer,
        forced: forced ?? this.forced,
        image: image ?? this.image,
      );

  factory YesOrNot.fromJsonMap(Map<String, dynamic> json) => YesOrNot(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : 'no',
      fromWho: FromWho.hers,
      imageUrl: image);
}
