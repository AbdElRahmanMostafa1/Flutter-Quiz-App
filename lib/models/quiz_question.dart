class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffleAnswers() {
    final shuffledAnswersCopy = List.of(answers);
    shuffledAnswersCopy.shuffle();

    return shuffledAnswersCopy;
  }
}
