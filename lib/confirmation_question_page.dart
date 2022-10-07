import 'package:flutter/material.dart';
import 'package:flutter_application/block_component.dart';
import 'package:flutter_application/model/block.dart';
import 'package:flutter_application/model/service.dart';

class ComfirmationQuestionpage extends StatefulWidget {
  const ComfirmationQuestionpage({Key? key}) : super(key: key);

  @override
  _ComfirmationQuestionpageState createState() =>
      _ComfirmationQuestionpageState();
}

class _ComfirmationQuestionpageState extends State<ComfirmationQuestionpage> {
  late List<Block> blocklist = [];
  @override
  initState() {
    blocklist = Service().blocks;
    super.initState();
  }

  // body
  Widget _buildBody() {
    return ListView.builder(
      itemCount: blocklist.length,
      itemBuilder: (BuildContext context, int index) {
        return BlockComponent(block: blocklist[index]);
      },
    );
  }

  // button navBar
  Widget _bottomNavBar() {
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
              ),
              body: _buildBody(),
              bottomNavigationBar: _bottomNavBar())),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
