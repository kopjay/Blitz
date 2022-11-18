import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_prokit/Screens/QuizCard.dart';
import 'package:quiz_prokit/main.dart';
import 'package:quiz_prokit/utils/AppWidget.dart';
import 'package:quiz_prokit/utils/QuizColors.dart';
import 'package:quiz_prokit/utils/QuizConstant.dart';
// import 'package:marquee/marquee.dart' hide Marquee;
import 'dart:async';

class QuizAnswer extends StatefulWidget {
  static String tag = '/QuizAnswer';

  String question;
  QuizAnswer(this.question);

  @override
  _QuizAnswerState createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> {
  @override
  void initState() {
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('Time`s Up',
            fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'The answer is :',
              style: TextStyle(fontSize: 15),
            ).paddingTop(20),
            if (_clicked)
              Text(
                widget.question,
                style: TextStyle(color: Colors.green, fontSize: 15),
              ).paddingTop(30).paddingLeft(20).paddingRight(20),
            TextFormField(
              decoration: new InputDecoration(
                hintText: "Input Your Answer",
                labelText: "Answer",
              ),
            ).paddingAll(20),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _clicked = true;
                });
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
