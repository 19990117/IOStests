//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//class Controller {
//    var name="tu"
//    var label: UILabel?
//    @IBAction func clicked(){
//        print("I am clicked!")
//        label?.text = "I am clicked!!!"
//    }
//}
//let p = Controller()

class MyView:UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.close()
        UIColor.green.setFill()
        path.fill()
    }
}

class Controller: UIViewController{
    var label: UILabel?
    var triangle: MyView?
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.red
        
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label?.backgroundColor = UIColor.blue
        label?.textColor = UIColor.white
        label?.textAlignment = .center
        label?.text = "Hello World!"
        
        view.addSubview(label!)
        
        let imageurl = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537935904181&di=faebe8b7f09e74a39862e7b6ed8b9c80&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F30ecd5efa7adc50cadafd544.jpg")!
        let data = try! Data(contentsOf: imageurl)
        let image = UIImage(data: data)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 400, height: 400))
        imageView.image = image
        view.addSubview(imageView)
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 50))
        button.setTitle("Click Me", for: UIControlState.normal)
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        //添加一个绿色三角形
        triangle = MyView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        triangle?.backgroundColor = UIColor.clear
        view.addSubview(triangle!)
    } 
    @IBAction func clicked() {
        print("I am clicked!")
        label?.text = "I am clicked!!!"
        UIView.animate(withDuration: 1){
            self.triangle?.center = CGPoint(x: self.view.bounds.width/2, y: 0)
        }
    }
}
let controller = Controller()
PlaygroundPage.current.liveView = controller

//let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
//view.backgroundColor = UIColor.red
//let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
//label.backgroundColor = UIColor.blue
//label.textColor = UIColor.white
//label.textAlignment = .center
//label.text = "Hello World!"
//view.addSubview(label)
//
//let imageurl = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537935904181&di=faebe8b7f09e74a39862e7b6ed8b9c80&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F30ecd5efa7adc50cadafd544.jpg")!
//let data = try! Data(contentsOf: imageurl)
//let image = UIImage(data: data)
//let imageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 400, height: 400))
//imageView.image = image
//view.addSubview(imageView)
//
//
//let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 50))
//button.setTitle("Click Me", for: UIControlState.normal)
//button.backgroundColor = UIColor.gray
//button.addTarget(p, action: #selector(Controller.clicked), for: UIControlEvents.touchUpInside)
//view.addSubview(button)

//Controller..label = label
//PlaygroundPage.current
