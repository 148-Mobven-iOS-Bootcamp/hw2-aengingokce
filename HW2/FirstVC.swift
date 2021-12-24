//
//  ViewController.swift
//  HW2
//
//  Created by Ahmet Engin Gökçe on 20.12.2021.
//

import UIKit

protocol DataDelegate {
    func dataTransfer(data: String)
}

class FirstVC: UIViewController {
    
    @IBOutlet weak var firstView: UIView!

    static let myNotification = Notification.Name("NC")
    
    //Created for closure
    var myName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(uiViewTapped))
        firstView.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: FirstVC.myNotification, object: nil)
    }
    
    @objc func uiViewTapped() {
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    @objc func onNotification(notification: Notification) {
        print("Gökçe (Notification Center)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondVC
            secondVC.delegate = self
            dismiss(animated: true) {
                secondVC.setName(self.getName())
            }
        }
    }
    
    func getName() -> String {
        return myName
    }
}

extension FirstVC: DataDelegate {
    func dataTransfer(data: String) {
        print(data)
    }
}
