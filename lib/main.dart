import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/quizBrain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cool_alert/cool_alert.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.black,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      title: 'True or False',
      home: Scaffold(
        appBar: AppBar(
          title: Text('True of False'),
          centerTitle: true,
          leading: Icon(Icons.book),
          actions: [
            Icon(Icons.more_horiz)
          ],
        ),
        body: QuestionPage(),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionNumber =0;

  List<Icon>scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
          CoolAlert.show(context: context,
              type: CoolAlertType.success,
          text: "You Have Succesfully completed the Quiz",
          title: 'Quiz complete!',
            autoCloseDuration: Duration(seconds: 6)
          );
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          print('You Answered True.That is correct answer');
          scoreKeeper.add(
              Icon(FontAwesomeIcons.grinSquint, color: Colors.green,));
        } else{
          print('That is Incorrect answer.You answered False.');
        scoreKeeper.add(Icon(FontAwesomeIcons.frown, color: Colors.red,));
      }
      quizBrain.nextQuestion();
    }
    });
  }

/*  List<String> Question = ['Walnut wood has higher density than Pine',

    'Mt.Everest is the Tallest Mountain in the world',
    'Greyhound dogs run faster than cheetah',
    'Planet earth is older than 18 billion years',
    'Solar system consists of 9 planets '
  ];

  List<bool> questionAnswers = [true,true,false,false,false];*/

/*  List<Question> questionBank = [
    Question('Walnut wood has higher density than Pine', true),
    Question('Greyhound dogs run faster than cheetah', true),
    Question('Planet earth is older than 18 billion years', false),
    Question('Solar system consists of 9 planets', false),
    Question('California lies towards east of United States', false),
  ];*/
  @override
  Widget build(BuildContext context) {

    return SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: scoreKeeper,
        ),
        Expanded(
          flex: 3,
            child: Center(child: Text(quizBrain.getQuestionText(),style: TextStyle(fontSize: 18.0,),))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade600)),
                onPressed: (){
               checkAnswer(true);
                },
                child: Text('TRUE',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),)),
          ),

        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade600)),
                onPressed: (){
                  checkAnswer(false);
/*                  bool correctAnswer = quizBrain.getCorrectAnswer();
                  if (correctAnswer == false){
                    print('You Answered False. That is a correct Answer');
                  } else
                    print('Sorry that is Incorrect.You Answered True.');
                  setState(() {
                    quizBrain.nextQuestion();
                  });*/
                },
                child: Text('FALSE',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),)),
          ),

        ),



      ],
    )
    );
  }
}

