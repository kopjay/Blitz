import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_prokit/Screens/QuizAnswer.dart';
import 'package:quiz_prokit/utils/AppWidget.dart';
import 'package:quiz_prokit/utils/QuizColors.dart';
import 'package:quiz_prokit/utils/QuizConstant.dart';
// import 'package:marquee/marquee.dart' hide Marquee;
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';

// this is for running Words

class QuizCards extends StatefulWidget {
  static String tag = '/QuizCards';

  String speed;
  String question;
  String quizType;
  final int indexType;

  QuizCards(this.speed, this.question, this.indexType, this.quizType);

  @override
  _QuizCardsState createState() => _QuizCardsState();
}

class _QuizCardsState extends State<QuizCards> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: (int.parse(widget.speed) - 1)), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => QuizAnswer(widget.question)));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * int.parse(widget.speed);
    widget.question = widget.question.replaceAll('[', '');
    widget.question = widget.question.replaceAll(']', '');

    List<String> stringList = widget.question.split(", ");
    widget.question.replaceAll(',', '');

    return Scaffold(
      appBar: AppBar(
        title: text('Timer',
            fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(alignment: Alignment.center),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return Text('End');
                      }
                      return Text(
                        '${time.sec}',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ).paddingLeft(180);
                    },
                  ),
                ],
              ),
            ),
            if (widget.indexType == 0) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      if (widget.quizType == 'Words' ||
                          widget.quizType == 'Number' ||
                          widget.quizType == 'Letter') ...[
                        for (int i = 0; i < 2; i++) ...[
                          FadeAnimatedText(
                            stringList[i],
                            duration: Duration(seconds: 3),
                            fadeOutBegin: 0.2,
                            fadeInEnd: 0.1,
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        ],
                      ],
                    ],
                  ),
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds: 6)),
                    builder: (c, s) => s.connectionState == ConnectionState.done
                        ? AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              if (widget.quizType == 'Words' ||
                                  widget.quizType == 'Number' ||
                                  widget.quizType == 'Letter') ...[
                                for (int i = 2; i < 4; i++) ...[
                                  FadeAnimatedText(
                                    stringList[i],
                                    duration: Duration(seconds: 3),
                                    fadeOutBegin: 0.2,
                                    fadeInEnd: 0.1,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ],
                            ],
                          )
                        : Text(""),
                  ),
                ],
              ).paddingTop(150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds: 8)),
                    builder: (c, s) => s.connectionState == ConnectionState.done
                        ? AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              if (widget.quizType == 'Words' ||
                                  widget.quizType == 'Number' ||
                                  widget.quizType == 'Letter') ...[
                                for (int i = 4; i < 6; i++) ...[
                                  FadeAnimatedText(
                                    stringList[i],
                                    duration: Duration(seconds: 2),
                                    fadeOutBegin: 0.2,
                                    fadeInEnd: 0.1,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ],
                            ],
                          )
                        : Text(""),
                  ),
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds: 5)),
                    builder: (c, s) => s.connectionState == ConnectionState.done
                        ? AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              if (widget.quizType == 'Words' ||
                                  widget.quizType == 'Number' ||
                                  widget.quizType == 'Letter') ...[
                                for (int i = 6; i < 8; i++) ...[
                                  FadeAnimatedText(
                                    stringList[i],
                                    duration: Duration(seconds: 3),
                                    fadeOutBegin: 0.2,
                                    fadeInEnd: 0.1,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ],
                            ],
                          )
                        : Text(""),
                  ),
                ],
              ).paddingTop(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds: 9)),
                    builder: (c, s) => s.connectionState == ConnectionState.done
                        ? AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              if (widget.quizType == 'Words' ||
                                  widget.quizType == 'Number' ||
                                  widget.quizType == 'Letter') ...[
                                for (int i = 8; i < 10; i++) ...[
                                  FadeAnimatedText(
                                    stringList[i],
                                    duration: Duration(seconds: 3),
                                    fadeOutBegin: 0.2,
                                    fadeInEnd: 0.1,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ],
                            ],
                          )
                        : Text(""),
                  ),
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds: 8)),
                    builder: (c, s) => s.connectionState == ConnectionState.done
                        ? AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              if (widget.quizType == 'Words' ||
                                  widget.quizType == 'Number' ||
                                  widget.quizType == 'Letter') ...[
                                for (int i = 10; i < 12; i++) ...[
                                  FadeAnimatedText(
                                    stringList[i],
                                    duration: Duration(seconds: 3),
                                    fadeOutBegin: 0.2,
                                    fadeInEnd: 0.1,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ],
                            ],
                          )
                        : Text(""),
                  ),
                ],
              ).paddingTop(100),
            ] else ...[
              IgnorePointer(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Marquee(
                        child: Text(
                          widget.question +
                              '                                                                                                              ',
                          style: TextStyle(fontSize: 30),
                        ).paddingLeft(200).paddingTop(300),
                        directionMarguee: DirectionMarguee.oneDirection,
                        animationDuration:
                            Duration(seconds: int.parse(widget.speed) + 2),
                        pauseDuration: Duration(milliseconds: 0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
