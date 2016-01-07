//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Maxim on 22.12.15.
//  Copyright © 2015 Maxim. All rights reserved.
//

import UIKit
import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests 
    
    func testMealInitialization (){
        let potentialItem = Meal(name: "New meal", photo: nil, rating: 4)
        XCTAssertNotNil(potentialItem) // checking if object IS NOT nil
        
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is not allowable") // checking if object IS nil
        
        let badRating = Meal(name: "Bad Rating Case", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative Rating is not allowed")
    }
}
