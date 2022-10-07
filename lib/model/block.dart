import 'package:flutter_application/model/question.dart';

class Block {
  Block(this.id, this.title, this.questions);
  int id;
  String title;
  List<Question> questions = [];
}
