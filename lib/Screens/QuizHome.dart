import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_prokit/Screens/NewQuiz.dart';
import 'package:quiz_prokit/Screens/QuizDetails.dart';
import 'package:quiz_prokit/Screens/QuizRunning.dart';
import 'package:quiz_prokit/model/QuizModels.dart';
import 'package:quiz_prokit/utils/AppWidget.dart';
import 'package:quiz_prokit/utils/QuizColors.dart';
import 'package:quiz_prokit/utils/QuizDataGenerator.dart';
import 'package:quiz_prokit/utils/QuizStrings.dart';
import 'package:quiz_prokit/utils/QuizWidget.dart';

import 'QuizNewList.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late List<NewQuizModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    int dataPass = 0;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            32.height,
            Text(quiz_lbl_hi_antonio, style: boldTextStyle(size: 24))
                .paddingTop(25),
            8.height,
            Text(
              quiz_lbl_what_would_you_like_to_learn_n_today_search_below,
              style: primaryTextStyle(color: quiz_textColorSecondary),
              textAlign: TextAlign.center,
            ).paddingBottom(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(quiz_lbl_new_quiz, style: boldTextStyle(size: 18)),
                Text(
                  quiz_lbl_view_all,
                  style: primaryTextStyle(color: quiz_textColorSecondary),
                ).onTap(
                  () {
                    setState(
                      () {
                        QuizRunning().launch(context);
                      },
                    );
                  },
                ),
              ],
            ).paddingAll(16),
            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mListings.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    NewQuiz(mListings[index], index).onTap(
                  () {
                    QuizDetails(dataPass = index).launch(context);
                  },
                ),
              ),
            ).paddingOnly(bottom: 20, left: 10, right: 25, top: 10),
          ],
        ),
      ),
    );
  }
}
