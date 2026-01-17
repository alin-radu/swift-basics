
import Cocoa

//
//
// Extensions
// Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.
var quote = "   The truth is rarely pure and never simple   "

let trimmedNoExt = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
}

let trimmedExt = quote.trimmed()

func trimFn(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmedFn = trimFn(quote)

//
//
// adding custom initializer to structs
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

//
//
// Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types.
let guests = ["Mario", "Luigi", "Peach"]

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

//
//
// More importantly, by extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs. This is really powerful, and leads to a technique Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
