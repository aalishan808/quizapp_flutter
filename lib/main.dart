
import 'package:flutter/material.dart';
import 'package:quizapp/quizbrain.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:
      Scaffold(

        appBar: AppBar(title: Text("Quiz App"), backgroundColor: Colors.blueGrey,),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(



            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
  void getlist(){
    _QuizPageState p = _QuizPageState();
    p.scorekeeper.clear();
  }

}


class _QuizPageState extends State<QuizPage> {

  Quizbrain quizbrain = Quizbrain();


  List<Icon> scorekeeper = [

  ];

  void checkAnswer(bool correctanswer,bool userpicanswer){
    if(correctanswer==userpicanswer){
      scorekeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    }
    else{
      scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          )
      );
    }
  }



  void initialize()

  {

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child:
              Text(quizbrain.getquestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'reset',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {

                setState(() {
                  scorekeeper.clear();


                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {

                bool correctanswer = quizbrain.getquestionAnswer();
                checkAnswer(correctanswer,true);
                setState(() {
                  quizbrain.nextquestion(context);
                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctanswer =quizbrain.getquestionAnswer();
                checkAnswer(correctanswer, false);
                setState(() {
                  quizbrain.nextquestion(context);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

