import 'dart:math';

import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_question.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/repository.dart';

class RepositoryForm implements IRepositoryForm {
  @override
  Future<List<FormCategory>> getCategories() async {
    await Future.delayed(const Duration(seconds: 3));

    return List.generate(10, (index) => FormCategoryDynamic(id: index+1, name: 'Category ${index+1}'));
  }

  @override
  Future<List<FormQuestion>> getQuestionOfCategory(int categoryId) async {
    await Future.delayed(const Duration(seconds: 3));

    return List.generate(Random().nextInt(20)+1, (index) => FormQuestion(
      id: index+1,
      question: 'Question $index:$categoryId?',
    ));
  }
}