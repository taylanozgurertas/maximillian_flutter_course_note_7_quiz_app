import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_summary.dart';

/*

 */

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

/*
normalde böyle getSummaryData gibi fonksiyonlarımız varsa
ve bunlar parametre falan da almıyorsa sadece başka bi şeylere dayalı bi şeyler olusturuyorsa 
mesela iste getSummaryData yerine get summaryData yazsaydık getter demek oluyor bu 
hala bir metod ama getSummaryData() diye böyle çağırmamıza gerek yok sanki değişkenmiş gibi summaryData yazarak kullanabiliyoruz!
epey iyi bir olay. property gibi kullanılabiliyor yani. getterın olayı bu. burada kullanmadık ama ilerde kullanacağız. 
 */
  List<Map<String, Object>> getSummaryData() {
    //mapler koleksiyonlar valuelar ve keyler var biliyon.
    //List içinde mapler olsun dedik mapler de String olsun keyleri değerleri de object olsun yani değer her şey olabilir demek
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      //loop body bu da klasik for döngüsü biliyon.
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0], //çünkü hep 1.si doğru cevaptı öyle ayarladıydık
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;

    /*
    where metodu burada maplerde orijinal listeyi değiştirmeden belli bir şarta göre filtreleme yapmamızı sağlar
    yeni iterable döner
     */

    /*
    arrow function nedir?
    kompleks bir kod yoksa tek satırlık işimiz varsa 
    mesela hemen aşağıdaki kodda şu tarz yapabilirdik (data) => data....blabla; şeklinde
    arrow function deniyor return bile yazmamıza gerek kalmıyor aşağıdaki yöntemle de yapmak zararlı değil 
    ama optional bir şey olsa da bil yani kısaltmalarda bir sürü projede yapılıyor.
     */
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] ==
          data['correct_answer']; //where mapin icindekilere tek tek bakar şarta uyanı ekler yeni iterable olusturur
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
