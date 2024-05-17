part of 'main.dart';

class _Stepper extends StatelessWidget {
  const _Stepper({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: context.read<FormStepsBloc>().formGroup,
      child: Column(
        children: [
          BlocSelector<FormStepsBloc, FormStepsState, bool>(
            selector: (state) => state.categoryState is StateLoading,
            builder: (context, isLoading) {
              return isLoading? const LinearProgressIndicator() : Container();
            },
          ),
          Expanded(
            child: BlocSelector<FormStepsBloc, FormStepsState, List<FormCategory>>(
              selector: (state) => state.categories,
              builder: (context, categories) {
                return BlocSelector<FormStepsBloc, FormStepsState, FormCategory>(
                  selector: (state) => state.selectedStep,
                  builder: (context, selectedStep) {
                    return Column(
                      children: [
                        Expanded(
                          child: _FormWrapper(selectedStep: selectedStep, categories: categories),
                        ),
                        _StepControl(selectedStep: selectedStep, categories: categories),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
