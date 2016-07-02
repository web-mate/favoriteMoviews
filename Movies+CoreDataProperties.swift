//
//  Movies+CoreDataProperties.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 2/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var movieTitle: String?
    @NSManaged var movieDescription: String?
    @NSManaged var movieimdb: String?
    @NSManaged var movieImage: NSData?

}
