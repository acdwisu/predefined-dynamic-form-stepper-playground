import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_question.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/repository.dart';

class UseCaseGetQuestion {
  final IRepositoryForm repositoryForm;

  UseCaseGetQuestion({required this.repositoryForm});

  Future<List<FormQuestion>> call(int categoryId) => repositoryForm.getQuestionOfCategory(categoryId);
}