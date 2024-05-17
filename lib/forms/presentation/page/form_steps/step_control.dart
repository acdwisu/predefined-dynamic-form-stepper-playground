part of 'main.dart';

class _StepControl extends StatelessWidget {
  final FormCategory selectedStep;
  final List<FormCategory> categories;

  const _StepControl({super.key, required this.selectedStep, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(selectedStep!=categories.first)
          Expanded(
            child: TextButton(
              child: const Text('Prev'),
              onPressed: () {
                if(selectedStep==categories.first) {
                  return;
                }

                context.read<FormStepsBloc>().add(FormStepsSetSelectedStepEvent(
                    category: categories[
                    categories.indexOf(selectedStep)-1
                    ]
                ));
              },
            ),
          ),
        if(selectedStep!=categories.last)
          Expanded(
            child: TextButton(
              child: const Text('Next'),
              onPressed: () {
                if(selectedStep==categories.last) {
                  return;
                }

                context.read<FormStepsBloc>().add(FormStepsSetSelectedStepEvent(
                    category: categories[
                    categories.indexOf(selectedStep)+1
                    ]
                ));
              },
            ),
          )
        else
          Expanded(
            child: TextButton(
              child: const Text('Submit'),
              onPressed: () {
                context.read<FormStepsBloc>().add(FormStepsPopulateFormValuesEvent());
              },
            ),
          ),
      ],
    );
  }
}
