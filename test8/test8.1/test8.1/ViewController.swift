//
//  ViewController.swift
//  test8.1
//
//  Created by Jerome on 2018/11/27.
//  Copyright © 2018年 Jerome. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell")!
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

