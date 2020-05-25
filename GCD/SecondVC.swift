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
        delay(3) {
            self.loginAlert()
        }
    }
    
//    метод  delay asyncAfter
    
    fileprivate func delay (_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
//    метод для создания логина alert
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Зарегистрированы?", message: "Введите Ваш логин и пароль", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Введите логин"
        }
        
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Введие пароль"
            userPasswordTF.isSecureTextEntry = true
            
        }
        
        self.present(ac, animated: true, completion: nil)
    }
    
    
    
    
    
    fileprivate func fetchImage() {
        
        imageURL = URL (string: "https://upload.wikimedia.org/wikipedia/commons/9/96/Apple_III%2B.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                
                self.image = UIImage(data: imageData)
            }
        }
    }
    
}
