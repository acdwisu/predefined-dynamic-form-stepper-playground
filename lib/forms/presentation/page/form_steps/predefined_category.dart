part of 'main.dart';

class PredefinedCategory {
  final categories = List.generate(3, (index) {
    return FormCategoryPredefined(
        id: index+1,
        name: 'Predefined Category ${index+1}',
        questions: List.generate(Random().nextInt(10)+1, (index2) => FormQuestion(
            id: index2+1,
            question: 'Predefined question ${index2+1}:${index+1}'
        ))
    );
  });
}