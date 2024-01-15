import Cocoa

// functions

func printTimesTables(num: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(num) is \(i * num)")
    }
}

printTimesTables(num: 5, end: 20)

// return values from functions

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let res = rollDice()
print(res)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

//
// return multiple values from functions;
// return array
func getUser1() -> [String] {
    ["Taylor", "Swift"]
}
let user1 = getUser1()
print("Name: \(user1[0]) \(user1[1])")


// return dictionary
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}
let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")


// return tuples, tuples have a fixed size and can have a variety of data types;
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

//
//There are three other things it’s important to know when using tuples.
// First, if you’re returning a tuple from a function, Swift already knows the names you’re giving each item in the tuple, so you don’t need to repeat them when using return.
func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// sometimes you’ll find you’re given tuples where the elements don’t have names. When this happens you can access the tuple’s elements using numerical indices starting from 0, like this:
func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}

let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")

// finally, if a function returns a tuple you can actually pull the tuple apart into individual values if you want to.
func getUser6() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

// version1
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName

//version2
let (firstName, lastName) = getUser6()
print("Name: \(firstName) \(lastName)")

print("Name: \(firstName) \(lastName)")

//
// customize parameter labels
// remove the external parameter label
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

// one to use externally, and one to use internally
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

// default values for parameters
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)
printTimesTables(for: 5)

// handle errors in functions
enum PasswordError: Error{
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string1 = "123456"

do {
    let result = try  checkPassword(string1)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print (PasswordError.short)
}catch PasswordError.obvious{
    
}catch {
    print("There was an error.")
}


