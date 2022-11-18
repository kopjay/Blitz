import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_prokit/utils/AppWidget.dart';
import 'package:quiz_prokit/utils/QuizColors.dart';
import 'package:quiz_prokit/utils/QuizConstant.dart';
import 'package:quiz_prokit/utils/QuizWidget.dart';
import 'package:quiz_prokit/Screens/QuizCard.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

// import 'package:marquee/marquee.dart' hide Marquee;

class QuizStart extends StatefulWidget {
  static String tag = '/QuizStart';

  final String quizType;
  final int indexType;

  QuizStart(this.quizType, this.indexType);

  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  @override
  void initState() {
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  double _currentSliderValue = 15;
  TextEditingController sliderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String question;

    // number
    Random random = new Random();
    late var numberQuiz = new List.generate(12, (_) => random.nextInt(100));

    // letter
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

    // final words = all;
    List<String> words = [];
    // tes.add(all.take(50).toString());
    if (widget.indexType == 0) {
      for (var i = 0; i < 12; i++) {
        words.add(all[random.nextInt(1000)]);
      }
    } else {
      for (var i = 0; i < 12; i++) {
        words.add(all[random.nextInt(1000)]);
      }
    }

    // var words = all[random.nextInt(100)];

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(random.nextInt(_chars.length))));

    if (widget.indexType == 0) {
      if (widget.quizType == 'Number') {
        question = numberQuiz.toString();
      } else if (widget.quizType == 'Letter') {
        question = getRandomString(12).replaceAllMapped(
            RegExp(r".{1}"), (match) => "${match.group(0)}, ");
      } else if (widget.quizType == 'Words') {
        question = words.toString();
      } else {
        question =
            'This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package';
      }
    } else {
      if (widget.quizType == 'Number') {
        question = new List.generate(12, (_) => random.nextInt(100)).toString();
      } else if (widget.quizType == 'Letter') {
        question = getRandomString(12).replaceAllMapped(
            RegExp(r".{1}"), (match) => "${match.group(0)}, ");
      } else if (widget.quizType == 'Words') {
        question = words.toString();
      } else {
        question =
            'This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package This project is a starting point for a Dart package';
      }
    }
    question.replaceAll('[', '');
    question.replaceAll(']', '');

    return Scaffold(
      appBar: AppBar(
        title: text('Start Quiz ' + widget.quizType,
            fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'Timer',
              style: TextStyle(fontSize: 20),
            ).paddingTop(200),
            Text(_currentSliderValue.round().toString() + ' Seconds',
                    style: TextStyle(fontSize: 20))
                .paddingTop(5),
            Slider(
              value: _currentSliderValue,
              max: 45,
              min: 15,
              divisions: 2,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            quizButton(
                textContent: 'Start',
                onPressed: () {
                  QuizCards(_currentSliderValue.round().toString(), question,
                          widget.indexType, widget.quizType)
                      .launch(context);
                }).withWidth(150).center().paddingTop(20),
          ],
        ),
      ),
    );
  }
}
