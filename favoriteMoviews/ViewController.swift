//
//  ViewController.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 2/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview:UITableView!
   
    
    var allMovies = [Movies]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell{
        let movie = allMovies[indexPath.row]
         cell.configureCell(movie)
        return cell
    } else {
        return MovieCell()
    }

    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
  


}

