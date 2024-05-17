part of 'main.dart';

class _FormViewer extends StatelessWidget {
  final FormCategory category;
  final List<FormQuestion> questions;

  const _FormViewer(
      {super.key, required this.category, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(category.name),
        Expanded(
          child: ListView(
              children: questions
                  .map((e) => Row(
                children: [
                  Text(e.type.name),
                  Expanded(
                    child: Column(
                      children: [
                        Text(e.question),
                        ReactiveTextField(
                          formControl: () {
                            final form = context.read<FormStepsBloc>().formGroup;

                            late final String formGroupName;

                            if(category is FormCategoryPredefined) {
                              formGroupName = 'pd_${category.id}';
                            } else {
                              formGroupName = category.id.toString();
                            }

                            return (form.control(formGroupName) as FormGroup).control(e.id.toString()) as FormControl;
                          }(),
                        )
                      ],
                    ),
                  )
                ],
              ))
                  .toList()),
        ),
      ],
    );
  }
}
