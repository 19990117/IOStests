//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 2016110425. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        
        scrollView.contentSize = CGSize(width: 7*scrollView.bounds.width, height: scrollView.bounds.height)
//        最大缩放倍数
//        scrollView.minimumZoomScale = 0.2
//        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

