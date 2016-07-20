//
//  DetailsVC.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 7/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//

import UIKit
import CoreData

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imdburl: UITextView!
    @IBOutlet weak var imageOfMovie: UIImageView!
    @IBOutlet weak var descTitleMovie: UILabel!
    @IBOutlet weak var titleMovieDetail: UILabel!

    var programVar : Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let prag = programVar {
        configureMovieData(prag)
           
        }
    }
    func configureMovieData(movie:Movies) {
        imdburl.text = movie.movieimdb
        descTitleMovie.text = movie.movieDescription
        titleMovieDetail.text = movie.movieTitle
        imageOfMovie.image = movie.retrieveImg()
    }

   

}
