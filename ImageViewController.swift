//
//  ImageViewController.swift
//  Timeline
//
//  Created by Trong Le on 12/27/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // get image URL
    private func getImage() {

        if let url = imageURL {
            spinner?.startAnimating()
            
            // Set up multithreading
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    if url == self.imageURL {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                }
            }
        }
    }
    
    // Update size of image to frame of  picture
    @IBOutlet var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    
    private var imageView = UIImageView()
    
    // Get image and size accordingly
    private var image: UIImage? {
        get { return imageView.image }
        set {
            spinner?.stopAnimating()
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    // Set up image
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            getImage()
        }
    }

}
