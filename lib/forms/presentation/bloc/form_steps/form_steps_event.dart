part of 'form_steps_bloc.dart';

@immutable
abstract class FormStepsEvent {}

class FormStepsGetCategoryEvent extends FormStepsEvent {}

class FormStepsGetQuestionEvent extends FormStepsEvent {
  final FormCategory formCategory;

  FormStepsGetQuestionEvent({required this.formCategory});
}

class FormStepsSetSelectedStepEvent extends FormStepsEvent {
  final FormCategory category;

  FormStepsSetSelectedStepEvent({required this.category});
}

class FormStepsPopulateFormValuesEvent extends FormStepsEvent {}