
import Cocoa

// First, the things that classes and structs have in common include:
//
// You get to create and name them.
// You can add properties and methods, including property observers and access control.
// You can create custom initializers to configure new instances however you want.
// However, classes differ from structs in five key places:
//
// You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// Even if you make a class constant, you can still change its properties as long as they are variables.

//
//
// make one class inherit from another
// Tip: If you know for sure that your class should not support inheritance, you can mark it as final.
// This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }

    override func printSummary(){
        print("I work \(hours) hours a day.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

//
//
// add initializers for classes
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

//
//
// copy classes, classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data
class User {
    var username = "Anonymous"
}
var user1 = User()
var user2 = user1
print(user1.username)
print(user2.username)
user2.username = "Taylor"
print(user1.username)
print(user2.username)

// create a unique copy of a class instance
class User1 {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

//
//
// create a deinitializer for a class
//This comes with a few small provisos:
//
//1. Just like initializers, you don’t use func with deinitializers – they are special.
//2. Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//3. Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//4. We never call deinitializers directly; they are handled automatically by the system.
//5. Structs don’t have deinitializers, because you can’t copy them.
class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

// Now we can create and destroy instances of that quickly using a loop – if we create a User instance inside the loop, it will be destroyed when the loop iteration finishes;

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
}

// remember, the deinitializer is only called when the last remaining reference to a class instance is destroyed. This might be a variable or constant you have stashed away, or perhaps you stored something in an array;
var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// work with variables inside classes
class User3 {
    var name = "Paul"
}

let user = User3()
user.name = "Taylor"
print(user.name)

//

struct Test{
    var name = "Paul"
}

var test1 = Test()

print(" 1 = \(test1.name)")

test1.name = "test1"

print(" 2 = \(test1.name)")

//

struct BankAccount{
    var depozit:Int
    
    mutating func increaseDepozit(amount:Int){
        depozit += amount
    }
}

var bankAccount = BankAccount(depozit: 1000)
bankAccount.increaseDepozit(amount: 500)


//

struct User4 {
    var name = "Taylor"
}

let user3 = User4()

let user4 = User4()

