//
//  ChatroomViewController.swift
//  chatroom
//
//  Created by Jiawei Tan on 2018-03-22.
//  Copyright © 2018 Jiawei Tan. All rights reserved.
//

import UIKit

class ChatroomViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBAction func Logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
    }
    @IBOutlet weak var outputArea: UITextView!
    @IBOutlet weak var inputArea: UITextField!
    @IBOutlet weak var textUIView: UIView!
    
    
    override func viewDidLoad() {
        inputArea.delegate = self
        outputArea.delegate = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.outputArea.layoutManager.allowsNonContiguousLayout = false
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputArea {
            let text: String! = inputArea.text
            if (!text.isEmpty) {
                inputArea.text = ""
                outputArea.text.append(text)
                outputArea.text.append("\n")
                outputArea.scrollRangeToVisible(NSMakeRange(outputArea.text!.count - 1, 1))
                print(text)
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == inputArea) {
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

