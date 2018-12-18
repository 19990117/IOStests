//
//  FirstViewController.swift
//  myTest
//
//  Created by student on 2018/10/18.
//  Copyright © 2018年 123. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        label.text = "Hello World"
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "First"
    }
    
    @IBAction func btnClicked(){
        label.text = "I am Clicked!"
//        present(SecondViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
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
