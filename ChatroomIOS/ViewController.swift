//
//  ViewController.swift
//  chatroom
//
//  Created by Jiawei Tan on 2018-03-21.
//  Copyright © 2018 Jiawei Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textView: UIView!
    @IBAction func RegisterBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    @IBAction func BackToLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    @IBAction func GoToChatroom(_ sender: Any) {
        self.performSegue(withIdentifier: "toChatroom", sender: self)
    }
    
    var textViewOriginalLocation: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0);
    var identifier: String! = ""
    
    
    override func viewDidLoad() {
        username.delegate = self
        password.delegate = self
        super.viewDidLoad()
        setGradientBackground()
        textViewOriginalLocation = self.textView.frame
        identifier = self.restorationIdentifier
        print(identifier)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        moveTextFields(scale: 0)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == username || textField == password) {
            moveTextFields(scale: -50)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            moveTextFields(scale: 0)
            if (identifier == "loginPage") {
                self.performSegue(withIdentifier: "toChatroom", sender: self)
            }
        }
        return true
    }
    
    func moveTextFields(scale: CGFloat) {
        if (scale == 0) {
            UIView.animate(withDuration: 0.2, animations: {
                self.textView.frame = self.textViewOriginalLocation
            })
        } else if (self.textView.frame != self.textViewOriginalLocation) {
            // do nothing
        } else {
            let location: CGRect = self.textView.frame
            UIView.animate(withDuration: 0.2, animations: {
                self.textView.frame = CGRect(x: location.origin.x, y: location.origin.y + scale, width: location.size.width, height: location.size.height)
            })
        }
    }
    
    func setGradientBackground() {
        let colorTop = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.80]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

}

