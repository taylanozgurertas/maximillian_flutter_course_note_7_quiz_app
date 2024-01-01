//bu blueprint olacak sorular için model sınıf

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  //bu constructor functionumuzda böyle

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    //Listlerin of constructor fonksiyonu var mesela yeni bir liste yapıyor başka bir listeyi base alarak.
    shuffledList.shuffle(); //shufle metodu listeyi harmanlar ve hafızada da değiştirir.
    /*
    burada final olarak tanımlanan List nasıl değişiyor?
    çünkü final olarak tanımlama yaptığımızda reassign yapamıyoruz artık. o yüzden değişmez diyoruz genel olarak.
    yani reassign yapılamaz shuffledList e yeni bir liste assign edemezsin. ama varolan list in içeriğini değiştirebilirsin. 
     
     */
    return shuffledList;
  }
}
