//
//  Movies.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 2/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movies: NSManagedObject {
    
    func setImage(img: UIImage)  {
        let data = UIImagePNGRepresentation(img)
        self.movieImage = data
        
    }
    
    func retrieveImg() -> UIImage {
        let img = UIImage(data: self.movieImage!)!
        return img
        
    }

}
