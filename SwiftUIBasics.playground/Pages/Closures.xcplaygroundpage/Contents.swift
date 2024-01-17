import Cocoa

//
//
// create a function and assign it to a variable/constant
func greetUser() {
    print("Hi there, test!")
}
var greetCopy = greetUser
greetCopy()

// type annotation
var greetCopy2: () -> Void = greetUser
greetCopy2()

// closure expression, assign the functionality directly to a constant or variable
let greetCopy3 = {
    print("Hi there!")
}
greetCopy3()

// closure with parameters, in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself
let sayHello1 = { (name: String) -> String in
    "Hi \(name)!"
}
sayHello1("TestName")

//
//
// add a function to sorted method
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeamFunc = team.sorted(by: captainFirstSorted)
print(captainFirstTeamFunc)

let captainFirstTeamClosure = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeamClosure)

// trailing closures, when one function accepts another as its parameter, like sorted() does, we can use a special syntax called trailing closure syntax
let captainFirstTeamClosure2 = team.sorted {name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
print(captainFirstTeamClosure2)

// shorthand syntax, swift can automatically provide parameter names for us, $1,$2 ...
let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

// a closure simplified
let reverseTeamSimplified = team.sorted {
    return $0 > $1
}

let reverseTeamSimplified2 = team.sorted { $0 > $1 }

// example1
let tOnly = team.filter { item in item.hasPrefix("T") }
let tOnly2 = team.filter {(item) -> Bool in item.hasPrefix("T") }
let tOnly3 = team.filter{ $0.hasPrefix("T")}
print(tOnly)
print(tOnly2)
print(tOnly3)

// example2
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//
//
// accept functions as parameters
// example1
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

// using closure as parameter
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

// using functions as parameter
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls1 = makeArray(size: 50, using: generateNumber)
print(newRolls1)

// example2
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
