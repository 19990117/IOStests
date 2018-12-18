//
//  ViewController.swift
//  test9
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 2016110425. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "please choose color", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "cyan", style: .default, handler: { (action) in self.view.backgroundColor = UIColor.cyan}))
        alert.addAction(UIAlertAction(title: "yellow", style: .default, handler: { (action) in self.view.backgroundColor = UIColor.yellow}))
        alert.addAction(UIAlertAction(title: "lightGray", style: .default, handler: { (action) in self.view.backgroundColor = UIColor.lightGray}))
        alert.addAction(UIAlertAction(title: "white", style: .default, handler: { (action) in self.view.backgroundColor = UIColor.white}))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "login message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text,let password = alert.textFields?.last?.text else{
                return
            }
            print("username = \(username) password = \(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
        }))
        alert.addTextField{ (textField) in
            textField.placeholder = "your user name"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "your password"
            textField.isSecureTextEntry = true
        }
        present(alert,animated: true,completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

