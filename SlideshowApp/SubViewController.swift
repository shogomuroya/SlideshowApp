//
//  SubViewController.swift
//  SlideshowApp
//
//  Created by work on 2023/02/01.
//

import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = image
        
        imageView.image = result
       

    }
    
    @IBOutlet weak var imageView: UIImageView!
     
    var image:UIImage?

   
    
    
    
    
    
}
