// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let maximumNumberOfLoginAttempts  = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

//let `import` = "jfakldsf"
//`import`

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
friendlyWelcome

let languageName = "Swift"
//languageName = "Swift++"

println(friendlyWelcome)
println("The cunrrent value of friendlyWelcome is \(friendlyWelcome)")

let minValue = UInt8.min
let maxValue = UInt16.max
let meaningOfLife = 42
let pi = 3.14159
let anoterPi = 3 + 0.14159;

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let haxadecimalDouble = 0xC.3p0
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let cannotBeNageative: UInt8 = 0
let tooBig:Int8 = Int8.max-1+1;

let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourFiveNine

let integerPi = Int(pi)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
let orangesAreOrange = true;
let turnipsAreDelicious = false;
if turnipsAreDelicious{
    println("Mmm, tasty turnips!")
}else {
    println("Eww, turnips are horrible.")
}

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
println("The status message is \(statusMessage)")

let(justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")
println("The status code is \(http404Error.0)")
println("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()

if (convertedNumber != nil) {
    println("\(possibleNumber) has an integer value of \(convertedNumber!)")
}else {
    println("\(possibleNumber) could not be converted to an integer")
}

if let actualNumber = possibleNumber.toInt(){
    println("\(possibleNumber) has an integer value of \(actualNumber)")
    
}else {
     println("\(possibleNumber) could not be converted to an integer")
}

var serverResponseCode: Int? = 404
serverResponseCode = nil
serverResponseCode = 404
serverResponseCode!
serverResponseCode = nil
//serverResponseCode!

var surverAnswer: String?
let possibleString: String? = "An optional string."
println(possibleString!)

let assumedString: String? = "An implicityly unwrapped optional string."
println(assumedString)

if (assumedString != nil) {
    println(assumedString )
}
//上面的代码为什么不能直接把assumedString作为一个判断条件？

if let definiteString = assumedString{
    println(definiteString)
}

let  age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
println(age)

let b = 10
var a = 5
a = b;
let (x1,y1) = (1,2)
x1
y1

"hello," + "world"

let dog: Character = "d"
let cow: Character = "c"
//let dogCow = dog + cow

let minusSix = -6
let alsoMinusSix = +minusSix

let contentHeight = 40
let hasHeader = true;
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

for index in 1...5{
    println(index)
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count-1
for i in 0...count {
    println("第\(i+1) 个人叫\(names[i])")
}

let str2 = "Str\ting(\"\") "
//let dollarSign = "\x24"
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    println("Nothing to see here")
}

var str11 = "fjadskf"
var str22 = ""
str22 = str11
str22 = "ufoiadf"
str11

for Character in "Dog!????"{
    println(Character)
}
let unusualMenagerie = "Koala ????, Snail ????, Penguin ????,Dromedary ????"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")

let dogString = "Dog!????"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}

var shoppingList2 = ["Eggs", "Milk"]
println("The shopping list contains \(shoppingList2.count) items")
shoppingList2.append("Flour")
//shoppingList2 +=  "Baking Powder";
shoppingList2 += ["Chocolate Spread", "Cheese" , "Butter"]

var firstItem = shoppingList2[0]
shoppingList2[0] = "Six eggs"
shoppingList2
shoppingList2[3...5] = ["Bananas", "Apples"]
shoppingList2.insert("Maple Syrup", atIndex: 0)
let mapleSyrup = shoppingList2.removeAtIndex(0)
firstItem = shoppingList2[0]
let apples = shoppingList2.removeLast()
for item in shoppingList2{
    print(item)
}
for (index, value) in enumerate(shoppingList2){
    println("Item \(index+1): \(value)")
}

var someInts = [Int]()
println("someInts is of type Int[] with \(someInts.count) items.")
someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue:0.0)
var anotherFourDoubles = [Double](count: 4, repeatedValue:2.5)
var sevenDoubles = threeDoubles + anotherFourDoubles

//var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports = ["TYO":"Tokyo", "DUB":"Dublin"]
println("The dictionary of airports contains \(airports.count) items")

airports["LHR"] = "London"
airports["LHR"] = "London Hearhrow"
let oldValue = "Dublin"
if  oldValue == airports.updateValue("Dublin Internation", forKey: "DUB"){
    println("\(oldValue)")
}

//if let fjalsd : String? = "jfdkla"  {
//println("fda")
//}

airports["APL"] = "Apple Internation"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DU"){
    println("The removed is \(removedValue).")
}

for( airportCode, airportName) in airports{
    println("\(airportCode) : \(airportName)")
}
for airportCode in airports.keys{
    println()
}
for airportName in airports.values{
    println()
}

let airportsCodes = Array(airports.keys)
let airportNames = Array(airports.values)

var namesOfIntegers = Dictionary<Int, String>()
namesOfIntegers[16] = "sixteen"
namesOfIntegers
//namesOfIntegers = [:]


let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
println("\(answer)")

let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis \(x) ")
case (0,let y):
    println("on the y-axis \(y)")
case let(x,y):
    println("somewhere else at (\(x),\(y)")
}

func join(s1: String,s2: String, joiner: String) ->String{
    return s1 + joiner + s2
}
join("hello", "world", ",")

func join(string s1: String, toString s2: String, withJoiner joiner : String) ->String{
    return s1 + joiner + s2
}
join(string: "hello", toString: "world", withJoiner: ",")

func containsCharacter(#string: String, #characterToFind: Character)->Bool{
    for character in string{
        if character == characterToFind{
            return true
        }
    }
    return false
}
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")

func join2(string s1:String, toString s2:String, withJoiner joiner: String = "") ->String {
    return s1 + joiner + s2
}
join2(string : "hello", toString: "world")

func join3(s1: String, s2: String, joiner: String = " ")->String{
    return s1 + joiner + s2
}
join3("hello", "world", joiner: "-")
join3("hello", "world")

func arithmeticMean(numbers: Double...) -> Double{
    var total:Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)
arithmeticMean(3,8,20)

func alignRight(var string: String, count: Int, pad: Character)->String{
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad{
        string = string + " -"
    }
    return string
}
//let originalString = "hello"
let paddedString = alignRight("Hello", 10, "+")

func swapTwoInts(inout a: Int, inout b: Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt

func addTwoInts(a:Int, b:Int) ->Int{
    return a + b
}

var mathFunction : (Int, Int) ->Int = addTwoInts
println((mathFunction(2,3)))

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int){     println("Result: \(mathFunction(a, b))")  } printMathResult(addTwoInts, 3, 5)

//func stepForward(input: Int) -> Int{
//        return input + 1
//}
//func stepBackward(input: Int)-> Int{
//    return input - 1
//}
//
//func chooseStepFunction(backwards: Bool) -> (Int)-> Int{
//        return backwards ? stepBackward : stepForward
//}
//
//var currentValue = 3
//let moveNearerToZero = chooseStepFunction(currentValue > 0)
//
////moveNearerToZero(3)
//
////println("Counting to zero:")
//
//while currentValue != 0 {
//    println("\(currentValue)...")
//    currentValue = moveNearerToZero(currentValue)
//}

//func chooseStepFunction (backwards: Bool) -> (Int) -> Int{
//        func stepForward(input: Int) ->Int {return input + 1}
//        func stepBackward(input: Int) ->Int {return input - 1}
//        return backwards ? stepBackward : stepForward
//}
//
//var currentValue = 5
//let moveNearerToZero = chooseStepFunction(currentValue > 0)
//while currentValue != 0{
//    println("\(currenValue)...")
//    currentValue = moveNearerToZero(currentValue)
//}



//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
