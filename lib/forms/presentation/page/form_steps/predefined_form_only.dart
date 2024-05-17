part of 'main.dart';

class _PredefinedFormOnly extends StatelessWidget {
  final List<FormCategoryPredefined> categories;

  const _PredefinedFormOnly({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: categories.map((e) => _FormViewer(
        category: e,
        questions: e.questions,
      )).toList(),
    );
  }
}
