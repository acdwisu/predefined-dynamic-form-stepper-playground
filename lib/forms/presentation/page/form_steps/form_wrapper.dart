part of 'main.dart';

class _FormWrapper extends StatelessWidget {
  final FormCategory selectedStep;
  final List<FormCategory> categories;

  const _FormWrapper({super.key, required this.selectedStep, required this.categories});

  @override
  Widget build(BuildContext context) {
    // return _MixedForm(
    //   categories: categories,
    //   selectedStep: selectedStep,
    // );

    return  BlocSelector<FormStepsBloc, FormStepsState, bool>(
      selector: (state) => state.categoryState is StateLoaded,
      builder: (context, isLoaded) => isLoaded? _MixedForm(
        categories: categories,
        selectedStep: selectedStep,
      ) : _PredefinedFormOnly(categories: categories.cast()),
    );
  }
}
