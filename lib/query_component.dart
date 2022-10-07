import 'package:flutter/material.dart';
import 'package:flutter_application/model/query.dart';

class QueryComponent extends StatefulWidget {
  const QueryComponent({Key? key, required this.querys}) : super(key: key);
  final List<Query> querys;

  @override
  _QueryComponentState createState() => _QueryComponentState();
}

class _QueryComponentState extends State<QueryComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.querys.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, i) {
          return widget.querys[i].type == 1
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Image.asset("assets/images/query_open.png"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(widget.querys[i].query,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                          )),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Image.asset("assets/images/query_as.png"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(widget.querys[i].query,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          )),
                    ),
                  ],
                );
        });
  }
}
