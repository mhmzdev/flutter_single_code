part of '../tasks.dart';

class _CategoriesList extends StatelessWidget {
  const _CategoriesList();

  @override
  Widget build(BuildContext context) {
    final categories = mockCategories;
    final screenState = _ScreenState.s(context, true);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: categories.map(
          (category) {
            final selected = screenState.category.id == category.id;
            return ListTile(
              tileColor: selected ? Colors.grey[200] : null,
              title: Text(category.name),
              onTap: () {
                if (Responsive.isMobile(context)) {
                  Scaffold.of(context).closeDrawer();
                }
                screenState.setCategory(category);
              },
              trailing: Text(
                category.tasks.length.toString(),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
