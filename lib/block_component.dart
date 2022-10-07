import 'package:flutter/material.dart';
import 'package:flutter_application/model/block.dart';
import 'package:flutter_application/model/question.dart';
import 'package:flutter_application/question_component.dart';

class BlockComponent extends StatefulWidget {
  const BlockComponent({Key? key, required this.block}) : super(key: key);
  final Block block;
  @override
  _BlockComponentState createState() => _BlockComponentState();
}

class _BlockComponentState extends State<BlockComponent> {
  Widget _buildListQuestion() {
    List<Question> listQuestion = widget.block.questions;
    List<Widget> listQuestionBuild = [];
    for (Question question in listQuestion) {
      listQuestionBuild.add(QuestionComponent(question: question));
    }
    return Column(
      children: listQuestionBuild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              width: double.infinity,
              child: Text(
                widget.block.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            _buildListQuestion()
          ]),
    );
  }
}
