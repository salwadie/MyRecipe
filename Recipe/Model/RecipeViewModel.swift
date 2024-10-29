//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by Sara Alwadie on 26/04/1446 AH.
//

import Foundation
import SwiftUI
import PhotosUI

final class RecipeViewModel: ObservableObject {
    @Published var recipeName: String = ""
    @Published var recipeImage: UIImage?
    @Published var recipeDescription: String = ""
    @Published var showAddRecipeSheet: Bool = false
    
    @Published var ingredientName: String = ""
    @Published var selectedMeasurement: String = "Spoon"
    @Published var serving: Int = 1
    
    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [Recipe] = []
    
    func addIngredient(name: String, measurement: String, serving: Int) {
        
        let newIngredient = Ingredient(name: name, measurement: measurement, serving: serving)
        ingredients.append(newIngredient)
        
        
        ingredientName = ""
        selectedMeasurement = "Spoon"
        self.serving = 1
    }
    
    func addRecipe() {
        let newRecipe = Recipe(
            name: recipeName,
            image: recipeImage,
            description: recipeDescription,
            ingredients: ingredients
        )
        
        recipes.append(newRecipe)
        
        // Reset fields
        recipeName = ""
        recipeImage = nil
        recipeDescription = ""
        ingredients = []
        
        print("Added recipe with ingredients")
        print(recipes)
    }
    
    
    func deleteRecipe(recipe: Recipe, completion: @escaping () -> Void) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes.remove(at: index)
            completion()
        }
    }

    
    
    func editRecipe(originalRecipe: Recipe, newName: String, newDescription: String, newImage: UIImage?) {
        if let index = recipes.firstIndex(where: { $0.id == originalRecipe.id }) {
            // Update the recipe details
            recipes[index].name = newName
            recipes[index].description = newDescription
            recipes[index].image = newImage
        }
    }


}
