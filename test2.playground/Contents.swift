//: Playground - noun: a place where people can play

import UIKit

//map：可以对数组中的每一个元素做一次处理，flatMap返回后的数组中不存在nil，同时它会把Optional解包
var dic:[[String:Any]] = [["name":"li","age":16],["name":"zhi","age":18],["name":"ming","age":20]]
var arr1 = dic.map{ $0["age"] }
print(arr1)

//filer：过滤，可以对数组中的元素按照某种规则进行一次过滤
var str = ["1","6","kk","jjj","7"]
var arr2 = str.filter{Int($0) != nil}
print(arr2)

//reduce：计算，可以对数组的元素进行计算 reduce方法中的第一个参数是初始值
var str2 = ["i","am","your","..."]
var n=0
var arr3 = str2.reduce(""){
    if n<str2.count-1{
        n=n+1
        return $0+$1+","
    }else{
        n=n+1
        return $0+$1
    }
}
print(arr3)

var number:[Int] = [3,4,8,7,9,6,5,2]
var numbers = number.reduce((max:number[0],min:number[0],sum:0)){
    (max($0.max,$1),min($0.min,$1),$0.sum+$1)
}
print(numbers)

func one()->Void{
    print("nil")
}
func two()->Int{
    return 1
}
func three(num:Int)->Void{
    print("return is nil")
}
func four(num:Int)->Int{
    return 2
}
var funcs:[Any] = [one,two,three,four]
//enumerated会返回一个新的序列，包含了初始序列里的所有元素，以及与元素相对应的编号
for(key,value) in funcs.enumerated(){
    if value is (Int)->Int{
        print("find it,key is \(key)")
    }
}

extension Int{
    func Sqrt() -> Double{
        return sqrt(Double(self))
    }
}

func found<T:Comparable>(a:T...)->(T,T)
{
    return a.reduce((max:a[0],min:a[0]), {(max($0.max,$1),min($0.min,$1))})
}

//第二题
enum protocolEnum{
    case teach
    case learn
}
protocol SchoolProtocol{
    var department:protocolEnum{get}
    func lendBook()
}
enum Gender:String{
    case male
    case female
    static func >(gen1:Gender,gen2:Gender) -> Bool{
        return gen1.rawValue > gen2.rawValue
    }
}
class Person: CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return self.firstName + self.lastName
        }
    }
    
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 1000, gender: Gender.male)
    }
    
    var description:String{
        return "name:\(firstName+lastName),age:\(age),gender:\(gender)"
    }
    func run() -> Void {
        print("person \(fullName) is running")
    }
}

class Teacher:Person,SchoolProtocol{
    var title:String
    var department: protocolEnum{return .teach}
    
    func lendBook() {
        print("teacher lend books")
    }
    
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: Gender.male)
    }
    
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 1000, gender: Gender.male, title: "teacher")
    }
    
    override var description: String{
        return super.description+"title:\(title)"
    }
    
    override func run() {
        print("Teacher \(fullName) is running")
    }
}

class student:Person,SchoolProtocol{
    var grade:Int
    var department: protocolEnum{return .learn}
    
    func lendBook() {
        print("student lend books")
    }
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,grade:  Int) {
        self.grade = grade
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 500, gender: Gender.male, grade: 90)
    }
    
    override var description: String{
        return super.description+"grade:\(grade)"
    }
    
    override func run() {
        print("Student \(fullName) is running")
    }
}

func == (left:Person,right:Person)->Bool{
    return left.firstName==right.firstName && left.lastName==right.lastName && left.age == right.age && left.gender == right.gender
}

func != (left:Person,right:Person)->Bool{
    return left.firstName != right.firstName || left.lastName != right.lastName || left.age != right.age || left.gender != right.gender
}

let p1 = Person(firstName: "li", lastName: "yuanfang", age: 1000, gender: Gender.male)
let p2 = Person(name: "direnjie")
let s1 = student(firstName: "zhou", lastName: "yu", age: 500, gender: Gender.male, grade: 80)
let s2 = student(name: "zhugeliang")
let t1 = Teacher(firstName: "lao", lastName: "fuzi", age: 1000, gender: Gender.male, title: "headTeacher")
let t2 = Teacher(name: "mozi")
var persons = [Person]()
persons.append(p1)
persons.append(p2)
persons.append(s1)
persons.append(s2)
persons.append(t1)
persons.append(t2)

for i in persons{
    i.run()
    if let a=i as? student{
        a.lendBook()
    }else if let a=i as? Teacher{
        a.lendBook()
    }else{
        print("no such person")
    }
}
