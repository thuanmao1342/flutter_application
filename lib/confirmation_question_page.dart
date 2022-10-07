import 'package:flutter/material.dart';

class ComfirmationQuestionpage extends StatefulWidget {
  const ComfirmationQuestionpage({Key? key}) : super(key: key);

  @override
  _ComfirmationQuestionpageState createState() =>
      _ComfirmationQuestionpageState();
}

class _ComfirmationQuestionpageState extends State<ComfirmationQuestionpage> {
  // body
  Widget _buildBody() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return _buildBLock();
      },
    );
  }

  Widget _buildListQuestion() {
    List<Widget> listQuestionBuild = [];
    for (int i = 0; i < 5; i++) {
      listQuestionBuild.add(_buildQuestion(i));
    }
    return Column(
      children: listQuestionBuild,
    );
  }

  Widget _buildQuestion(index) {
    List<Widget> listWidget = [];
    listWidget.add(
      Text(
        "${index + 1}. お名前は？: ",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    for (var i = 0; i < 5; i++) {
      listWidget.add(
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
            child: Text(
              'item ${i + 1}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      );
    }
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 1),
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.topLeft,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: listWidget,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildQuery(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('on tra loi');
                      },
                      child: const Text('再回答',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: const Size(45, 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(color: Colors.black45),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildQuery() {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, i) {
          return Row(
            children: [
              Image.asset("assets/images/query_open.png"),
              const SizedBox(width: 8),
              const Expanded(
                child: Text("Query three values on a",
                    style: TextStyle(fontSize: 14)),
              )
            ],
          );
        });
  }

  Widget _buildBLock() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              width: double.infinity,
              child: const Text(
                '健康',
                style: TextStyle(
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

  // button navBar
  Widget bottomNavBar() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      margin: const EdgeInsets.only(bottom: 10, top: 0, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {
          debugPrint('on submit data');
        },
        child: const Text('送信',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF0E6DF1),
          onPrimary: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: WillPopScope(
          onWillPop: () async => true,
          child: Scaffold(
              backgroundColor: const Color(0xFFF2F3F5),
              appBar: AppBar(
                title: const Text(
                  "情報確認",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.black),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                ),
                shadowColor: null,
              ),
              body: _buildBody(),
              bottomNavigationBar: bottomNavBar())),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
