//
//  ImageViewController.swift
//  Timeline
//
//  Created by Trong Le on 12/27/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    
    // get image URL making sure it's not nil
    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                getImage()
            }
        }
    }
    
    private func getImage() {
        if let url = imageURL {
            let imageData = NSData(contentsOfURL: url)
            if imageData != nil {
                image = UIImage(data: imageData!)
            } else {
                image = nil
            }
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        if image == nil {
            imageURL = LocationImages.Seattle
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            getImage()
        }
    }

}
