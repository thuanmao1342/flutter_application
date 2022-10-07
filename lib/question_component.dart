import 'package:flutter/material.dart';
import 'package:flutter_application/model/item.dart';
import 'package:flutter_application/model/query.dart';
import 'package:flutter_application/model/question.dart';
import 'package:flutter_application/model/service.dart';
import 'package:flutter_application/query_component.dart';

class QuestionComponent extends StatefulWidget {
  const QuestionComponent({Key? key, required this.question}) : super(key: key);
  final Question question;
  @override
  _QuestionComponentState createState() => _QuestionComponentState();
}

class _QuestionComponentState extends State<QuestionComponent> {
  Widget _buildListQuery() {
    List<Query> listQuery = Service().getQueriesByQid(widget.question.id);
    return Row(
      children: [
        Expanded(child: QueryComponent(querys: listQuery)),
        ElevatedButton(
          onPressed: () {
            debugPrint('on 再回答 data');
          },
          child: const Text('再回答',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          style: ElevatedButton.styleFrom(
            shadowColor: null,
            primary: Colors.white,
            onPrimary: Colors.black,
            minimumSize: const Size(77, 32),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(color: Colors.black12)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Item> listItems = Service().getItemsByQid(widget.question.id);
    List<Widget> listWidget = [];
    listWidget.add(Text(
      widget.question.title + ": ",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ));
    for (Item item in listItems) {
      listWidget.add(
        Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            item.data,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF000000),
            ),
          ),
        ),
      );
    }
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5.0,
            runSpacing: 5.0,
            children: listWidget,
          ),
          const SizedBox(
            height: 3,
          ),
          _buildListQuery(),
        ],
      ),
    );
  }
}
