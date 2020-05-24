//
//  SecondVC.swift
//  GCD
//
//  Created by Александр Реунов on 24.05.2020.
//  Copyright © 2020 Александр Реунов. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
            }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    fileprivate func fetchImage() {
        imageURL = URL (string: "https://upload.wikimedia.org/wikipedia/commons/9/96/Apple_III%2B.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
    
}
