//
//  AddMoviewVC.swift
//  favoriteMoviews
//
//  Created by dimitris vlagas on 2/7/16.
//  Copyright © 2016 webmate. All rights reserved.
//

import UIKit
import CoreData
class AddMoviewVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieTitle:UITextField!
    @IBOutlet weak var movieDesc:UITextField!
    @IBOutlet weak var movieImdb:UITextField!
    @IBOutlet weak var movieImg:UIImageView!
    @IBOutlet weak var addMovieButton:UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func addImage(sender:AnyObject!){
        presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    @IBAction func createMovie(sender:AnyObject){
        if let title = movieTitle.text where title != "" {
            if let desc = movieDesc.text where desc != "" {
                if let imdb = movieImdb.text where imdb != "" {
                    
                    let app = UIApplication.sharedApplication().delegate as! AppDelegate
                    let context = app.managedObjectContext
                    let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
                    let Movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
                   Movie.movieTitle = title
                   Movie.movieDescription = desc
                   Movie.movieimdb = imdb
                   Movie.setImage(movieImg.image!)
            
                   context.insertObject(Movie)
                    
                    do {
                        try context.save()
                    } catch {
                        print("Could not save recipe")
                    }
                    
                    self.navigationController?.popViewControllerAnimated(true)
                    
                    
                }
                
                
            }
            
       
        }
    }
    

   
}
