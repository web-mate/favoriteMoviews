//
//  MovieCell.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 2/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//

import UIKit
import CoreData

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle:UILabel!
    @IBOutlet weak var movieImg:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(movie:Movies){
        movieTitle.text = movie.movieTitle
        movieImg.image = movie.retrieveImg()
        
    }



}
