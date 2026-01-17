
import Cocoa

//
//
// simple struct, new type
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

//
//
// Where things get more interesting is when you want to have properties/values that can change
struct Employee {
    let name: String
    var vacationRemaining: Int = 10

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

//
//
// compute property values dynamically, get and set(receive newValue)
struct Employee1 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer1 = Employee1(name: "Sterling Archer", vacationAllocated: 14)
archer1.vacationTaken += 4
archer1.vacationRemaining = 5
print(archer1.vacationAllocated)

//
//
// property observers, didSet(receive oldValue) and willSet(receive newValue), take action when a property changes,
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

//
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

//
//
// create custom initializers
// member wise initializer
// just remember the golden rule: all properties must have a value by the time the initializer ends. If we had not provided a value for number inside the initializer, Swift would refuse to build our code.
struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

let player = Player(name: "Megan R", number: 15)

//
//
// limit access to internal data using access control, access controled
struct BankAccount {
    var funds = 100

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var bankAccount = BankAccount(funds: 100)
var banckAccount1 = bankAccount;

print("bankAccount= \(bankAccount.funds)")
print("bankAccount= \(banckAccount1.funds)")

bankAccount.funds = 200

print("---------------------------------")
print("bankAccount= \(bankAccount.funds)")
print("bankAccount= \(banckAccount1.funds)")

//
//
// static properties and methods
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

//
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

//struct Employee2 {
//    let username: String
//    let password: String
//
//    static let example = Employee(username: "cfederighi", password: "hairforceone")
//}

