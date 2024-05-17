part of 'main.dart';

class _MixedForm extends StatelessWidget {
  final FormCategory selectedStep;
  final List<FormCategory> categories;

  const _MixedForm({super.key, required this.selectedStep, required this.categories});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: categories.indexOf(selectedStep),
      children: categories.map((e) {
        if(e is FormCategoryPredefined) {
          return _FormViewer(
            category: e,
            questions: e.questions,
          );
        }

        if(e is FormCategoryDynamic) {
          return BlocSelector<FormStepsBloc, FormStepsState, IState>(
            selector: (state) {
              return state.questionState[e]!;
            },
            builder: (context, state) {
              if(state is StateLoaded<List<FormQuestion>>) {
                return _FormViewer(
                  category: e,
                  questions: state.data,
                );
              }

              return Column(
                children: [
                  const LinearProgressIndicator(),
                  Expanded(
                    child: _FormViewer(
                      category: e,
                      questions: [],
                    ),
                  ),
                ],
              );
            },
          );
        }

        return const Placeholder();
      }).toList(),
    );
  }
}
