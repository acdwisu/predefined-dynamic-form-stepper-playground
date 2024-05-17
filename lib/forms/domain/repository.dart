import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_question.dart';

abstract class IRepositoryForm {
  Future<List<FormCategory>> getCategories();
  Future<List<FormQuestion>> getQuestionOfCategory(int categoryId);
}