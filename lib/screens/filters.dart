import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/switch_button.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';


// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals'){
      //     Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (ctx)=>const TabsScreen()),);
      //   }
      // }),

   
      body: Column(
          children: [
            SwitchButton(
              onChanged: (isChecked) {
                 ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              value: activeFilters[Filter.glutenFree]!,
              title: 'Gluten Free',
              subtitle: 'Only Include gluten-free meals',
            ),
            SwitchButton(
              onChanged: (isChecked) {
                
                 ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
                
              },
              value: activeFilters[Filter.lactoseFree]!,
              title: 'Lactos Free',
              subtitle: 'Only Include lactos-free meals',
            ),
            SwitchButton(
              onChanged: (isChecked) {
                
                   ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                
              },
              value: activeFilters[Filter.vegetarian]!,
              title: 'Vegetarian',
              subtitle: 'Only Include vegetarian meals',
            ),
            SwitchButton(
              onChanged: (isChecked) {
                
                                  ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);

                
              },
              value: activeFilters[Filter.vegan]!,
              title: 'Vegan',
              subtitle: 'Only Include Vegan meals',
            ),
          ],
        ),
      );
    
  }
}
