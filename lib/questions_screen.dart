import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_button.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    /*
    flutterda state classlarda built in bir özellik var widget. diyerek asıl sınıftaki şeyleri kullanabiliyoruz erişebiliyoruz
     */
    widget.onSelectAnswer(selectedAnswer); //bu aslında chooseAnswer fonksiyonunu kullanıyor yani quiz.dart dosyasındaki
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //use as much width as you can demektir
      child: Container(
        margin: const EdgeInsets.all(
            40), //containerın margin verme özelliği vardır columnı container ile sarmalayıp margin verdik
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center, //texti hizalamaya yarar yatayda
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            /*
            map fonksiyonu önemli listlerin map fonksiyonu var listenin her bir itemini alır ve o itemler için 
            bir kod satırı çalıştırabiliriz tek tek her biri için. 
            map fonksiyonu bir listenin içindekileri başka bir şeye dönüştürmeye yarayabilir
            dart otomatik olarak tek tek listenin elemanlarını alıp fonksiyonu çalıştıracak
            gerçek objeyi değiştirmez map yeni bir list oluşturur hafızada yani map değiştirmiyor orijinal listeyi.
      
            ! ... operatörü bir listedeki veya yinelenebilir olan(iterable) şeydeki değerlerin hepsini alır listeden çıkartır 
      
            örnek:
            const numbers = [1,2,3];
            const moreNums = [numbers, 4]; ----> [[1,2,3],4]; 
            const moreNums = [...numbers,4]; --> [1,2,3,4];

            shuffle metodu da var listlerin. ancak orijinal listeyi editliyor shuffle metodu. 
            baya hafızadaki şeyi editliyor yani. 
             */
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

/*

 */