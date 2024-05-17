import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:predefined_dynamic_form_steps/common/bloc_state.dart';
import 'package:predefined_dynamic_form_steps/forms/data/repository.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/entity/form_question.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/usecase/get_category.dart';
import 'package:predefined_dynamic_form_steps/forms/domain/usecase/get_question.dart';
import 'package:predefined_dynamic_form_steps/forms/presentation/bloc/form_steps/form_steps_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'stepper.dart';
part 'predefined_form_only.dart';
part 'predefined_category.dart';
part 'form_viewer.dart';
part 'step_control.dart';
part 'form_wrapper.dart';
part 'mixed_form.dart';

class FormSteps extends StatefulWidget {
  const FormSteps({super.key});

  @override
  State<FormSteps> createState() => _FormStepsState();
}

class _FormStepsState extends State<FormSteps> {
  final _formRepo = RepositoryForm();
  final _predefinedCategory = PredefinedCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Steps'
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FormStepsBloc(
              getCategory: UseCaseGetCategory(repositoryForm: _formRepo),
              getQuestion: UseCaseGetQuestion(repositoryForm: _formRepo),
              predefinedCategories: _predefinedCategory.categories,
            )..add(FormStepsGetCategoryEvent()),
          ),
          Provider.value(
            value: _predefinedCategory,
          )
        ],
        child: const _Stepper(),
      ),
    );
  }
}
