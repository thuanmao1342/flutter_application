import 'package:flutter/material.dart';
import 'package:flutter_application/forgotid/forgot_id_form.dart';

class ForgotIdPage extends StatelessWidget {
  const ForgotIdPage({Key? key}) : super(key: key);

  _buildBody() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: const [
                Text(
                  'メールアドレスを入力し、「送信」ボタンを押してください。',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '認証コードのメールを入力したメールアドレス宛に送信します。',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const ForgotIdForm(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      child: WillPopScope(
          onWillPop: () async => true,
          child: Scaffold(
            backgroundColor: const Color(0xFFF2F3F5),
            appBar: AppBar(
              title:const Text(
                "パスワードをお忘れの方",
                style:  TextStyle(
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
          )),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
