//
//  Meal.swift
//  FoodTracker
//
//  Created by 株式会社エンジ on 2018/10/10.
//  Copyright © 2018 tam. All rights reserved.
//

import UIKit

class Meal {

    var name: String = ""
    var photo: UIImage?
    var rating: Int = 0

    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
