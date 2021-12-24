//
//  SecondViewController.swift
//  HW2
//
//  Created by Ahmet Engin Gökçe on 20.12.2021.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var secondView: UIView!
    
    var delegate: DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate?.dataTransfer(data: "Engin (Delegate)")
       
        NotificationCenter.default.post(name: FirstVC.myNotification, object: nil)
    }
    
    func setName(_ name: String) {
        print("Ahmet (Closure)")
    }

}
