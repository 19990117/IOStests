//: Playground - noun: a place where people can play

import UIKit

//EEEE：表示星期几（如 Monday）。使用 1-3 个字母表示周几的缩略写法。
//MMMM：月份的全写（如 October）。使用 1-3 个字母表示月份的缩略写法。
//dd：表示一个月里面日期的数字（如 09 或 15）。
//yyyy：4 个数字表示的年（如 2015）。
//HH：2 个数字表示的小时（如 08 或 19）。
//mm：2 个数字表示的分钟（如 05 或者 54）。
//ss：2 个数字表示的秒。
//zzz：3 个字母表示的时区（如 GMT）。
//GGG：BC 或者 AD。

let now = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年M月d日 EEEE aa HH:mm"
dateFormatter.locale = Locale.current
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let BeiJing = dateFormatter.string(from: now)
print(BeiJing)
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let Tokyo = dateFormatter.string(from: now)
print(Tokyo)
dateFormatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let newYork = dateFormatter.string(from: now)
print(newYork)
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let London = dateFormatter.string(from: now)
print(London)

var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
str[str.index(str.startIndex, offsetBy: 6)...str.index(str.startIndex, offsetBy: 20)]
str.removeSubrange(str.range(of: "OS")!)

var dic = [["time":BeiJing,"string":str],["time":Tokyo,"string":str],["time":newYork,"string":str],["time":London,"string":str]]as AnyObject
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("test.txt")
dic.write(toFile:url.path,atomically:true)
print(url.path)
let kk = NSDictionary(contentsOf: url)
print(kk as Any)

let imageUrl = URL(string: "http://pic5.photophoto.cn/20071228/0034034901778224_b.jpg")!
let imageData = try! Data(contentsOf: imageUrl)
let image = UIImage(data: imageData)
var imageLocalUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
imageLocalUrl.appendPathComponent("mypic.jpg")
try? imageData.write(to: imageLocalUrl)



