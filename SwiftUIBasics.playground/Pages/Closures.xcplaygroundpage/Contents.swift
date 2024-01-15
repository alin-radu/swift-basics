import Cocoa

func greetUser() {
    print("Hi there, test!")
}

greetUser()

var greetCopy = greetUser

// type annotation
// var greetCopy: () -> Void = greetUser

greetCopy()

// closure expression, assign the functionality directly to a constant or variable
let sayHello = {
    print("Hi there!")
}

sayHello()

// closure with parameters, in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself
let sayHello1 = { (name: String) -> String in
    "Hi \(name)!"
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeam1 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeam1)

// trailing closures and shorthand syntax
let captainFirstTeam2 = team.sorted{name1,name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
print(captainFirstTeam2)

// example1
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// example2
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

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

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

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
