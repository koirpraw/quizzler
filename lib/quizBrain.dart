import 'package:quizzler/question.dart';

import 'main.dart';

class QuizBrain{
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Mt. Everest is the highest mountain in the world',true),
    Question('Golden doodles are fastest running dog breed?',false),
    Question('Turmeric has antioxidant properties',true),
    Question('Planet earth is more than 15 billion years old',false),
    Question('You are dumber than me ?',false),
    Question('The Capital of Somalia is Nairobi',false),
    Question('Most guitar have 5 strings',false),
    Question('Christmas used to be originally celebrated in Month of April',false),

  ];

  void nextQuestion(){
    if (_questionNumber <= _questionBank.length-1){
      _questionNumber++;
    }

  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
}

bool isFinished(){
    if( _questionNumber >=_questionBank.length-1){
      print('you have reached $_questionNumber question.');
      return true;
    } else {
      return false;
    }
}

void reset(){
    _questionNumber =0;
}
}
