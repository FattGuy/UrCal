//
//  FoodPlan+CoreDataProperties.swift
//  UrCal
//
//  Created by Feng Chang on 6/28/16.
//  Copyright © 2016 Feng Chang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FoodPlan {

    @NSManaged var carb_name: String?
    @NSManaged var meat_name: String?
    @NSManaged var snack_name: String?
    @NSManaged var supp_name: String?
    @NSManaged var total_calorie: Double
    @NSManaged var vege_name: String?

}
