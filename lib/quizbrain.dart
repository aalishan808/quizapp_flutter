import 'package:flutter/cupertino.dart';
import 'package:quizapp/main.dart';
import 'question.dart';
import 'package:quickalert/quickalert.dart';


class Quizbrain {
    int _questionno =0;
  List<Question> _questionlist = [
    Question("The Great Wall of China is visible from space.", false),
    Question("The capital of Australia is Sydney.", false),
    Question("The chemical symbol for gold is Au.", true),
    Question("The Pacific Ocean is the largest ocean on Earth.", true),
    Question("The human body has a total of 206 bones.", true),
    Question("The Taj Mahal is located in New Delhi, India.", false),
    Question("The Great Barrier Reef is the largest coral reef system in the world", true),
    Question("The national animal of Pakistan in horse.", false),
    Question( "The primary colors are red, blue, and green.", true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),

  ];


  void nextquestion(BuildContext context)
  {

    if(_questionno<_questionlist.length-1){
      _questionno++;

      print(_questionlist.length);
      print(_questionno);
    }

    else {
      QuizPage p  = QuizPage();
      _questionno=0;
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        text: 'Reached the End',

      );

    }
    }


  String getquestionText(){
    return _questionlist[_questionno].questionText;
  }

  bool getquestionAnswer(){
    return _questionlist[_questionno].questionAnswer;
  }
}
