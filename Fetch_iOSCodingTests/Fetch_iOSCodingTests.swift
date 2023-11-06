//
//  Fetch_iOSCodingTests.swift
//  Fetch_iOSCodingTests
//
//  Created by Soyeon Lee on 10/31/23.
//

import XCTest
@testable import Fetch_iOSCoding

final class Fetch_iOSCodingTests: XCTestCase {

    func testGetAllIngredients() throws {
        let testMealDetail = MealDetailModel(idMeal: "testID",
                                             strMeal: "TestMeal",
                                             strDrinkAlternate: nil,
                                             strCategory: "TestCategory",
                                             strArea: nil,
                                             strInstructions: nil,
                                             strMealThumb: nil,
                                             strTags: nil,
                                             strYoutube: nil,
                                             strIngredient1: "IngredientA",
                                             strIngredient2: "IngredientB",
                                             strIngredient3: "IngredientC",
                                             strIngredient4: "IngredientD",
                                             strIngredient5: "IngredientE",
                                             strIngredient6: nil,
                                             strIngredient7: nil,
                                             strIngredient8: nil,
                                             strIngredient9: nil,
                                             strIngredient10: nil,
                                             strIngredient11: nil,
                                             strIngredient12: nil,
                                             strIngredient13: nil,
                                             strIngredient14: nil,
                                             strIngredient15: nil,
                                             strIngredient16: nil,
                                             strIngredient17: nil,
                                             strIngredient18: nil,
                                             strIngredient19: nil,
                                             strIngredient20: nil,
                                             strMeasure1: "MeasurementA",
                                             strMeasure2: "MeasurementB",
                                             strMeasure3: "MeasurementC",
                                             strMeasure4: "MeasurementD",
                                             strMeasure5: "MeasurementE",
                                             strMeasure6: nil,
                                             strMeasure7: nil,
                                             strMeasure8: nil,
                                             strMeasure9: nil,
                                             strMeasure10: nil,
                                             strMeasure11: nil,
                                             strMeasure12: nil,
                                             strMeasure13: nil,
                                             strMeasure14: nil,
                                             strMeasure15: nil,
                                             strMeasure16: nil,
                                             strMeasure17: nil,
                                             strMeasure18: nil,
                                             strMeasure19: nil,
                                             strMeasure20: nil,
                                             strSource: nil,
                                             strImageSource: nil,
                                             strCreativeCommonsConfirmed: nil,
                                             dateModified: nil)
        let mealDetailVM = MealDetailViewModel(meal:  Meal(strMeal: "Test", strMealThumb: "", idMeal: ""))
        let ingredients = mealDetailVM.getAllIngredients(mealDetail: testMealDetail)
        XCTAssertEqual(ingredients, [IngredientModel(ingredientName: "IngredientA", measurement: "MeasurementA"),
                                     IngredientModel(ingredientName: "IngredientB", measurement: "MeasurementB"),
                                     IngredientModel(ingredientName: "IngredientC", measurement: "MeasurementC"),
                                     IngredientModel(ingredientName: "IngredientD", measurement: "MeasurementD"),
                                     IngredientModel(ingredientName: "IngredientE", measurement: "MeasurementE")])
    }

}
