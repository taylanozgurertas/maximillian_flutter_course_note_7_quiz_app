import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //ozel buton widgetı olusturuyoruz string isteyecek ullanırken bunu buton ismi olarak göstereceğiz bir de onpressed olarak ayarlayalım onu da istesin butonun ne yapacagını da soylesin kullanırken
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  }); //constructor functionımız
  //ayarlarken required named parameter kullanacagız

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
