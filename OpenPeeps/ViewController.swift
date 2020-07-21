//
//  ViewController.swift
//  OpenPeeps
//
//  Created by guowei on 2020/7/20.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var leftimage: UIImageView!
    @IBOutlet weak var rightimage: UIImageView!
    
    var NumberOfImage=2
    
    
    let ImageArray=["bust-mask-1","bust-mask-2","bust-mask-3","bust-mask-4","bust-mask-5","bust-mask-6",
                    "bust-mask-7","bust-mask-8","bust-mask-9","bust-mask-10","bust-mask-11","bust-mask-12",
                    "bust-mask-13","bust-mask-14","bust-mask-15","bust-mask-16"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainimage.image=UIImage(named: ImageArray[NumberOfImage-1])
        leftimage.image=UIImage(named: ImageArray[NumberOfImage-2])
        rightimage.image=UIImage(named: ImageArray[NumberOfImage])
        
        
        
    }

    @IBAction func ChangeBtn(_ sender: UIButton) {
     
        if NumberOfImage + 1 < ImageArray.count {
            NumberOfImage += 1}
        else{
            NumberOfImage = 2
            
        }
        
        run(after: 1) {
            self.leftimage.frame.origin=CGPoint(x: CGFloat(26), y: CGFloat(213))
            self.rightimage.frame.origin=CGPoint(x: CGFloat(252), y: CGFloat(213))
            self.mainimage.frame.origin=CGPoint(x: CGFloat(69), y: CGFloat(385))
            
          
            self.mainimage.image=UIImage(named: self.ImageArray[self.NumberOfImage-1])
            self.leftimage.image=UIImage(named: self.ImageArray[self.NumberOfImage-2])
            self.rightimage.image=UIImage(named: self.ImageArray[self.NumberOfImage])
            
            UIView.animate(withDuration: 1, animations: {
            self.leftimage.alpha=1
            self.mainimage.alpha=1
            self.rightimage.alpha=1
                         })
            
        }
        UIView.animate(withDuration: 1.5, animations: {
            self.leftimage.frame.origin.x += 25
            self.leftimage.alpha=0
            self.mainimage.frame.origin.x -= 25
            self.mainimage.frame.origin.y -= 25
            self.mainimage.alpha=0
            self.rightimage.frame.origin.x -= 25
            self.rightimage.frame.origin.y += 25
            self.rightimage.alpha=0
            
                    })
        
    }
    
    func run(after seconds:Int, completion: @escaping() -> Void) {
        
        let deadline=DispatchTime.now() + .seconds(seconds)
        
        DispatchQueue.main.asyncAfter(deadline: deadline) {
        completion()
        }
    
    }
    
    
    @IBAction func Picker(_ sender: UIButton) {
        performSegue(withIdentifier: "goShowDetail", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowDetailViewController
        destinationVC.choosePic=ImageArray[self.NumberOfImage-1]
    }
    
    
}

