import 'package:flutter/material.dart';
import 'package:flutter_application_2/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}


/*
old onemli bi kac yorum satiri var

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        //Columna sizedbox verdik 300 verip heightini sınırladık ve scroll edilebilir yaptık singlechildscrollview widgetıyla
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1)
                    .toString()), //type casting yapabiliyoruz dart böylece data['question_index'] in int olacağını biliyor
                Expanded(
                  //Expanded widgetı cocuguna available spacei almasını saglar
                  //expanded kullanıldığında expandedın cocugu yani column bir üst widgettan yani Row widgetından daha fazla yer kaplayamaz hale gelir.
                  //böylece column sınırlarını bilir aşmaz olay bu.
                  child: Column(
                    children: [
                      Text(data['question']
                          as String), //yine type casting yapıyoruz Darta data['question'] un String olacağını bildiğimizi söylüyoruz
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}


 */