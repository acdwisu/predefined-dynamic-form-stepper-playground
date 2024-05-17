import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/repository.dart';

class UseCaseGetCategory {
  final IRepositoryForm repositoryForm;

  UseCaseGetCategory({required this.repositoryForm});

  Future<List<FormCategory>> call() => repositoryForm.getCategories();
}