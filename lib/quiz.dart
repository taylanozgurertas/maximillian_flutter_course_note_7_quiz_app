import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_screen.dart';
import 'package:flutter_application_2/results_screen.dart';
import 'package:flutter_application_2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  /*
  misal şu selectedAnswers başına _ atsaydık sadece bu dosyada bu sınıfın icinde kullanılabilir bir degisken olurdu
  yani _QuizState public zaten degil ama olsaydı bile başka bi dosyada _selectedAnswersı kullanamazdık. 
   */

  String activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    /*
  add metodu listlerde hangi liste add fonksiyonunu kullanıyorsan hafızadan ona erişir ve var olan listeye item ekler
  yani final olarak tanımlanmış bir list bile olsa sıkıntı olmaz çünkü reassign yapmıyor item ekliyor hafızada var olana erişip
  sıkıntı yok yani.
  */
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      //if condition yapısı
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    /*
    final screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen();
    /*
          ternary kullanımı blabla ? asdf : csdf
          blabla true ise asdf değilse csdf çalışır 
          ufak ve işlevsel bir condition
           */
    böyle yapıp daha sonra childa screenWidget denilerek de kullanılabilirdi
     */

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
