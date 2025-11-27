//
//  ResponseModel.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-18.
//
import Foundation

struct ResponseModel : Identifiable, Codable{
    let id: String
    let product: Product?
    let status: Int
}

struct Product : Codable {
    let name: String?
    let itemImg: URL?
    let ingredientsImg: URL?
    let nutritionImg: URL?
    let ingredients: String?
    
    enum CodingKeys: String, CodingKey {
            case name = "product_name"
            case itemImg = "image_front_url"
            case ingredientsImg = "image_ingredients_url"
            case nutritionImg = "image_nutrition_url"
            case ingredients = "ingredients_text_en"
        
        }
    
    init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            itemImg = try container.decode(URL.self, forKey: .itemImg)
            ingredientsImg = try container.decode(URL.self, forKey: .ingredientsImg)
            nutritionImg = try container.decode(URL.self, forKey: .nutritionImg)
            ingredients = try container.decode(String.self, forKey: .ingredients)
          
    }
}
