//: Playground - noun: a place where people can play

import UIKit

var array = [Int]()
for i in 2...100{
    var isPrime = true
    for j in 2..<i{
        if i % j == 0{
            isPrime = false
        }
    }
    if isPrime{
        array.append(i)
    }
}
func compare(one:Int,two:Int)->Bool{
    return one > two
}
array.sort(by: compare) //直接排序
array.sort(by: {(one:Int,two:Int) -> Bool in return one > two})
array.sort(by: {(one,two) in return one > two})
array.sort(by: {$0 > $1})//匿名闭包
array.sort(){$0 > $1}

//第二大题
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
}

class Teacher:Person{
    var title:String
    
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
}

class student:Person{
    var grade:Int
    
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
var stuNum = 0
var teaNum = 0
var perNum = 0
for i in 0..<persons.count{
    if persons[i] is student{
        stuNum += 1
    }else if persons[i] is Teacher{
        teaNum += 1
    }else{
        perNum += 1
    }
}
var perDic = [String:Int]()
perDic["Person"] = perNum
perDic["Teacher"] = teaNum
perDic["Student"] = stuNum

persons.sort{ $0.age > $1.age }
print(persons)
persons.sort{ $0.fullName > $1.fullName}
print(persons)
persons.sort{ $0.gender>$1.gender && $0.age>$1.age}
print(persons)


