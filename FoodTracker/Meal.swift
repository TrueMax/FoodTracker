//
//  Meal.swift
//  FoodTracker
//
//  Created by Maxim on 02.01.16.
//  Copyright © 2016 Maxim. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties 
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization 
    init?(name: String, photo: UIImage?, rating: Int){ // init? is a FAILABLE initializer
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
