class FormQuestion {
  final int id;
  final String question;
  final FormQuestionType type;

  FormQuestion({required this.id, required this.question, this.type=FormQuestionType.radio});
}

enum FormQuestionType {
  radio, text, number, date, dateTime, dropdown
}