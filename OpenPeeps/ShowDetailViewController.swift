//
//  ShowDetailViewController.swift
//  OpenPeeps
//
//  Created by guowei on 2020/7/21.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {

    var choosePic=""
    
    var formatter: DateFormatter! = nil
    
    let dataPicker=UIDatePicker()
    let calendar=Calendar.current
    
    @IBOutlet weak var BirthDateTxt: UITextField!
    
    @IBOutlet weak var chooseimage: UIImageView!
    
    @IBOutlet weak var nameTextfild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.date = NSDate() as Date

        chooseimage.image=UIImage(named: choosePic)
        creatDatePicker()
        
        // Do any additional setup after loading the view.
    }
    
    func creatDatePicker(){
           let toolbar=UIToolbar()
           toolbar.sizeToFit()
           let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
           toolbar.setItems([doneBtn], animated: true)
           
           BirthDateTxt.inputAccessoryView=toolbar
           
           //asign date picker to the text field
           BirthDateTxt.inputView=dataPicker
           dataPicker.datePickerMode = .date
           
           
       }
    
    @objc func donePressed(){
           //formate
           let formatter=DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .none
        
           BirthDateTxt.text=formatter.string(from: dataPicker.date)
        
        
           self.view.endEditing(true)
  }
}
