
import Cocoa

//
//
// Arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

var newArray1 = ["1","2","3"]
var newArray2 = Array<String>()
var newArray3 = [String]()
var newArray4:Array<String> = []
var newArray5:[String] = []

//
//
// Dictionaries
let employee = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
var archEnemies1:[String:String]=[:]
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

var newDictionary1 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
var newDictionary2 = Dictionary<String,String>()
var newDictionary3 = [String: String]()
var newDictionary4:Dictionary<String,String>=[:]
var newDictionary5:[String:String]=[:]

//
//
// Sets
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

var people1 = Set<String>()
people1.insert("Denzel Washington")
people1.insert("Tom Cruise")
people1.insert("Nicolas Cage")
people1.insert("Samuel L Jackson")

var newSet1 = Set(["1","2","3"])
var newSet2 = Set<String>()

//
//
// Enums
enum Weekday{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

//
// Type annotation
// Regardless of whether you use type inference or type annotation, there is one golden rule: Swift must at all times know what data types your constants and variables contain.

let surname: String = "Lasso"
var score: Int = 0
var albums3: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

//
