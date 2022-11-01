import 'package:flutter/material.dart';

class ForgotIdSuccess extends StatelessWidget {
  const ForgotIdSuccess({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 65,
                  child: Image.asset("assets/images/success_check_circle.png")),
              Container(
                margin: const EdgeInsets.only(
                    top: 20, right: 16, bottom: 20, left: 16),
                child: Text(
                  "thuan@gmail.com" + message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ログインに戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
