part of 'form_steps_bloc.dart';

@immutable
class FormStepsState {
  final IState categoryState;
  final Map<FormCategory, IState> questionState;
  final FormCategory selectedStep;
  final List<FormCategory> categories;

  const FormStepsState({required this.categoryState, required this.questionState, required this.selectedStep, required this.categories});

  FormStepsState copyWith({
    IState? categoryState,
    Map<FormCategory, IState>? questionState,
    FormCategory? selectedStep,
    List<FormCategory>? categories,
  }) => FormStepsState(
    categoryState: categoryState ?? this.categoryState,
    questionState: questionState ?? this.questionState,
    selectedStep: selectedStep ?? this.selectedStep,
    categories: categories ?? this.categories,
  );

  factory FormStepsState.initial(List<FormCategory> predefinedCategory) => FormStepsState(
    selectedStep: predefinedCategory.first,
    questionState: const {},
    categoryState: StateInitial(),
    categories: predefinedCategory,
  );
}
