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
   
    var mySelection: Int?
    var allMovies = [Movies]()
    var fetchResultsController : NSFetchedResultsController!
    
    var viewSelectedMovieName: String = ""
    var viewSelectedMovieDesc: String = ""
    var viewSelectedMovieimdb: String = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
  override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
    tableview.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.allMovies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
        let movie = allMovies[indexPath.row]
        let destinationVC = DetailsVC()
        destinationVC.programVar = movie
      
        performSegueWithIdentifier("detailsSeque", sender: destinationVC.programVar)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "detailsSeque") {
            let secondViewController = segue.destinationViewController as! DetailsVC
            let duration = sender as! Movies
            secondViewController.programVar = duration
        }
    }
    


}

