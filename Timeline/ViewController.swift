//
//  ViewController.swift
//  Timeline
//
//  Created by Trong Le on 12/27/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Set up segue between buttons to URL images
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Seattle" :
                    ivc.imageURL = LocationImages.Seattle
                    ivc.title = "Seattle, Washington"
                case "Hillsboro":
                    ivc.imageURL = LocationImages.Ohio.Hillsboro
                    ivc.title = "Hillsboro, Ohio"
                case "Columbus":
                    ivc.imageURL = LocationImages.Ohio.Columbus
                    ivc.title = "Columbus, Ohio"
                case "Cincinnati":
                    ivc.imageURL = LocationImages.Ohio.Cincinnati
                    ivc.title = "Cincinnati, Ohio"
                default: break
                }
            }
        }
    }

}

