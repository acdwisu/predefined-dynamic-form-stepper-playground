import 'package:equatable/equatable.dart';

import 'form_question.dart';

abstract class FormCategory extends Equatable {
  final int id;
  final String name;

  const FormCategory({required this.id, required this.name});
}

class FormCategoryDynamic extends FormCategory {
  FormCategoryDynamic({required super.id, required super.name});

  @override
  List<Object?> get props => [id];
}

class FormCategoryPredefined extends FormCategory {
  final List<FormQuestion> questions;

  const FormCategoryPredefined({required super.id, required super.name, required this.questions});

  @override
  List<Object?> get props => [id];
}