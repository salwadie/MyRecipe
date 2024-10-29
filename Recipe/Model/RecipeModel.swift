//
//  RecipeModel.swift
//  Recipe
//
//  Created by Sara Alwadie on 26/04/1446 AH.
//

import Foundation
import PhotosUI

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var measurement: String
    var serving: Int
}

struct Recipe: Identifiable {
    let id: UUID = .init()
    var name: String
    var image: UIImage?
    var description: String
    var ingredients: [Ingredient]
}


    
