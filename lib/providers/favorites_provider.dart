import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavourateMealsNotifier extends StateNotifier<List<Meal>>{
   FavourateMealsNotifier(): super([]);

   bool toggoleMealFavoruteStatus(Meal meal){
      final mealIsFavorite = state.contains(meal);
      /* 
         state global abailable state which holds our data which is immutable meas 
         we cannot edit data. so instead of add we should create or replace
         new state variable 
      */
      if(mealIsFavorite){
        state = state.where((m)=> m.id != meal.id).toList();  //creating new state (where always create new list) by removing data if already data exist
        return false;
      }else{
      state = [...state, meal]; // replacing data if it doesn;t exist with old + new
       return true;
      }
   }
}
final favoriteMealsProvider = StateNotifierProvider<FavourateMealsNotifier,List<Meal>>(
  (ref){
      return FavourateMealsNotifier();
  }
);