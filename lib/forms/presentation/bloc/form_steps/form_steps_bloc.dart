import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:predefined_dynamic_form_steps/common/bloc_state.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/usecase/get_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/usecase/get_question.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_steps_event.dart';
part 'form_steps_state.dart';

class FormStepsBloc extends Bloc<FormStepsEvent, FormStepsState> {
  final UseCaseGetCategory getCategory;
  final UseCaseGetQuestion getQuestion;
  final List<FormCategoryPredefined> predefinedCategories;
  
  late final FormGroup formGroup;

  FormStepsBloc({
    required this.predefinedCategories,
    required this.getCategory,
    required this.getQuestion,
  }) : super(FormStepsState.initial(
    predefinedCategories
  )) {
    on<FormStepsGetCategoryEvent>(_onGetCategory);
    on<FormStepsGetQuestionEvent>(_onGetQuestion);
    on<FormStepsSetSelectedStepEvent>(_onSetSelectedStep);
    on<FormStepsPopulateFormValuesEvent>(_onPopulateFormValues);

    formGroup = FormGroup(
      predefinedCategories.asMap().map((key, value) => MapEntry(
          'pd_${value.id}',
          FormGroup(
            value.questions.asMap().map((key, value) => MapEntry(
              value.id.toString(),
              FormControl<String>()
            ))
          )
        )
      )
    );
  }

  FutureOr<void> _onGetCategory(FormStepsGetCategoryEvent event, Emitter<FormStepsState> emit) async {
    emit(
      state.copyWith(
        categoryState: StateLoading()
      )
    );

    final result = await getCategory();

    final questionState = Map<FormCategory, IState>.from(state.questionState);

    for (var element in result) {
      questionState[element] = StateInitial();

      Future.delayed(const Duration(seconds: 1)).then((value) {
        add(FormStepsGetQuestionEvent(
          formCategory: element
        ));
      });
    }

    emit(
      state.copyWith(
        questionState: questionState,
        categoryState: StateLoaded(data: result),
        categories: List.from(state.categories)..insertAll(1, result)
      )
    );
  }

  FutureOr<void> _onGetQuestion(FormStepsGetQuestionEvent event, Emitter<FormStepsState> emit) async {
    if(event.formCategory is FormCategoryPredefined) {
      return;
    }

    var questionState = Map<FormCategory, IState>.from(state.questionState);

    questionState[event.formCategory] = StateLoading();

    emit(
      state.copyWith(
        questionState: questionState
      )
    );

    final result = await getQuestion(event.formCategory.id);

    questionState = Map<FormCategory, IState>.from(state.questionState);

    questionState[event.formCategory] = StateLoaded(data: result);

    formGroup.addAll({
      event.formCategory.id.toString(): FormGroup(
        result.asMap().map((key, value) => MapEntry(
          value.id.toString(),
          FormControl()
        ))
      )
    });

    emit(
        state.copyWith(
            questionState: questionState
        )
    );
  }

  FutureOr<void> _onSetSelectedStep(FormStepsSetSelectedStepEvent event, Emitter<FormStepsState> emit) {
    emit(state.copyWith(
      selectedStep: event.category
    ));
  }

  FutureOr<void> _onPopulateFormValues(FormStepsPopulateFormValuesEvent event, Emitter<FormStepsState> emit) {
    log(formGroup.value.toString());
  }
}
