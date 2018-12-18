//
//  ViewController.swift
//  MultiMVCDemo
//
//  Created by 505006 on 2018/12/5.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    var stu = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfName.text = stu.name
        tfNO.text = stu.no
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"{
            stu.no = tfNO.text!
            stu.name = tfName.text!
            let secVC = segue.destination as! SecondViewController
            secVC.stu = stu
        }
        if segue.identifier == "Third"{
            let thirdVC = segue.destination as! ThirdViewController
        }
    }
    
    
}

