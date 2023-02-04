//
//  ViewController.swift
//  SlideshowApp
//
//  Created by work on 2023/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButtom: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "toNext", sender: nil)
        
    }
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
     UIImage(named: "elephant.webp")!,
     UIImage(named: "road.webp")!,
     UIImage(named: "rower.jpg")!
    ]
                                
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageArray[nowIndex]
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
        
        imageView.image = imageView.image!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        let subViewcontroller:SubViewController = segue.destination as! SubViewController
        subViewcontroller.image = imageView.image!
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
  
        
    @IBOutlet weak var hiddenButtom: UIButton!
    @IBOutlet weak var hiddenButtom2: UIButton!
    @IBAction func slideShowButtom(_ sender: Any) {
        
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startButtom.setTitle("停止", for: .normal)
            hiddenButtom.isEnabled = false
            hiddenButtom2.isEnabled = false
        }   else {
            
            timer.invalidate()
            
            timer = nil
            
            startButtom.setTitle("再生", for: .normal)
            hiddenButtom.isEnabled = true
            hiddenButtom2.isEnabled = true
            
        }
    }
    @objc func changeImage() {
            nowIndex += 1
            
            if (nowIndex == imageArray.count) {
                nowIndex = 0
            }
            imageView.image = imageArray[nowIndex]
        }
    
        
    @IBAction func nextImage(_ sender: Any) {
        nowIndex += 1
          
        if (nowIndex == 3){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
        }
    @IBAction func backImage(_ sender: Any) {
        
        nowIndex -= 1
        
        if (nowIndex == -1){
            nowIndex = 2
        }
        imageView.image = imageArray[nowIndex]
    }
    }
    
    
    


