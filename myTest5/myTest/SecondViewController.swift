//
//  SecondViewController.swift
//  myTest
//
//  Created by student on 2018/10/18.
//  Copyright © 2018年 123. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image = UIImage(named: "0")
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 10, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Second"
        
    }
    
    @IBAction func btnClicked() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
