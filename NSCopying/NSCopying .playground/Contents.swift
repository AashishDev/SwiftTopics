//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject, NSCopying {
  var firstName: String
  var lastName: String
  var age: Int
  
  init(firstName: String, lastName: String, age: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  func copy(with zone: NSZone? = nil) -> Any {
    let copy = Person(firstName: firstName, lastName: lastName, age: age)
    return copy
  }
}


let person = Person(firstName: "Aashish", lastName: "Tyagi", age: 27)
let newPerson = person.copy() as! Person
newPerson.firstName = "Harish"

print(person.firstName)
print(newPerson.firstName)

