import 'package:flutter/material.dart';
import 'package:flutter_application/forgotid/forgot_id_success.dart';

class ForgotIdForm extends StatefulWidget {
  const ForgotIdForm({Key? key}) : super(key: key);

  @override
  _ForgotIdFormState createState() => _ForgotIdFormState();
}

class _ForgotIdFormState extends State<ForgotIdForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? errorEmail;
  Color inputColor = const Color(0xFFE3E5E8);
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _disable = true;
  _onChangeEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _disable = true;
        errorEmail = "メールアドレスを入力してください";
        inputColor = const Color(0xFFFF0000);
      });
    } else {
      bool regExp = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value);
      if (regExp) {
        setState(() {
          _disable = false;
          errorEmail = null;
          inputColor = const Color(0xFFE3E5E8);
        });
      } else {
        setState(() {
          _disable = true;
          errorEmail = "メールアドレスの形式が正しくありません";
          inputColor = const Color(0xFFFF0000);
        });
      }

      String text = value.toLowerCase();
      _emailController.value =
          TextEditingValue(text: text, selection: _emailController.selection);
    }
  }

  _errorText() {
    return errorEmail == null
        ? const SizedBox(height: 10)
        : Container(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: SizedBox(
                              width: 20.0,
                              child:
                                  Image.asset("assets/images/query_open.png"))),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 10,
                      )),
                      TextSpan(
                          text: errorEmail,
                          style: const TextStyle(
                              fontFamily: 'MPLUS1',
                              fontSize: 16,
                              color: Colors.red)),
                    ],
                  ),
                )),
          );
  }

  _getSubjectId() {
    debugPrint("getSubjectId: " + _emailController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ForgotIdSuccess(
        message: 'にメールが送信されました。',
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'メールアドレス',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: _emailController,
              autofocus: true,
              onChanged: (String value) {
                _onChangeEmail(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: inputColor,
                    )),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: 'メールアドレス',
                hintStyle:
                    const TextStyle(color: Color(0XFFACB0B9), fontSize: 17),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.mail_outline,
                    color: Color(0XFFACB0B9),
                  ),
                ),
              )),
          _errorText(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_disable) {
                return;
              }
              _getSubjectId();
            },
            style: ElevatedButton.styleFrom(
              primary: _disable ? Colors.grey : Colors.blue,
              onPrimary: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text('送信',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
          ),
        ],
      ),
    );
  }
}
