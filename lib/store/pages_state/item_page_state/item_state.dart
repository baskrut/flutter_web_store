import 'dart:collection';

import 'package:web_store/models/models/product.dart';
import 'package:web_store/store/reducer.dart';

class ItemState{
  final Product item;

  ItemState({this.item});

  factory ItemState.initial(){
    return ItemState(
      item: Product(),
    );
  }

  ItemState copyWith({
  Product item,
}){
    return ItemState(
      item: item ?? this.item,
    );
  }

  ItemState reducer(dynamic action){
    return Reducer<ItemState>(actions: HashMap.from({
    /*  RemoveFromFavoritesAction: (dynamic action) => removeFromFavorites(action.id),
      AddToFavoritesAction: (dynamic action) => addToFavorites(action.recipe),
      AddFavoriteRecipesAction: (dynamic action) => addFavorites(action.recipes),
      ReplaceFavoriteRecipesAction: (dynamic action) => _replaceFavoriteRecipes(action.allRecipes),*/
    })).updateState(action, this);
  }


/*  FavoritesState removeFromFavorites(int id) {
    recipes.removeWhere((element) => element.id == id);
    return copyWith(recipes: recipes);
  }

  FavoritesState addToFavorites(Recipe recipe) {
    recipes.add(recipe);
    return copyWith(recipes: recipes);
  }

  FavoritesState addFavorites(List<Recipe> serverRecipes) {
    return copyWith(recipes: serverRecipes);
  }

  FavoritesState _replaceFavoriteRecipes(List<Recipe> allRecipes) {
    final List<Recipe> newRecipes = allRecipes.where((element) => recipes.any((e) => e.id == element.id)).toList();

    return copyWith(recipes: newRecipes);
  }*/
}