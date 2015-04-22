// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let imlicitInteger = 70
let iplicitDouble = 70.0
let explicitDouble: Double = 70

let aaa: Float = 4
let label = "The width is"
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

var shoppingList = ["catfish", "water" , "tulips", "blue paint" ]

shoppingList[1] = "bottle of water"
var occupations = ["Malcolm" :"Captain", "Kaylee" : "Mechanic"]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
teamScore
let greeting1 = "Hello!"
var optionalString : String? = "Hello"
optionalString == nil
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
}

let vegetable = "red pepper"
switch vegetable {
    case "celery":
    let vegetableComment = "Add some raisins and make ants"
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea"
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)"
default:
    let vegetableComment = "Everything tastes good in soup"
}

let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11,13],
"Fibonacci":[1,1,2,3,5, 8],
"Square": [1, 4, 9, 16, 25],]

var largest = 0
var largestkind: String = ""
for(kind, numbers ) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestkind = kind
        }
    }
}

largest
largestkind


var n = 2
while n<100 {
    n = n*2
}
n

var m = 2
do {
m = m*2
}
while m<100
m


var firstForLoop = 0
for  (var i = 0 ;i < 10 ; i++) {
    firstForLoop += i
}
firstForLoop

//var firstForLoop2 = 0
//var i:Int = 1
//for i in 0..3 {
//    firstForLoop2 += i
//}

func greet (name: String, day: String, rice:String ) ->String{
    return "Hello \(name), today is \(day), eat \(rice)"
    
}
greet("Bob", "Tuesday","rice")

func getGasPrices() ->(Double, Double, Double){
    return (3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf (numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}
sumOf()
sumOf(42,597,12)


func returnFifteen() ->Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() ->(Int ->Int){
    func addOne(number : Int)-> Int{
        return 1+number
        
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int] , condition:(Int,Int) ->Bool) ->Bool
{
    for item in list{
        if condition(item,2){
            return true
        }
    }
    return false
}

func lessThanTen (number: Int,number2: Int) -> Bool{
    return number < 10
}
var numbers = [20,19,17,12]
hasAnyMatches(numbers, lessThanTen)


numbers.map({
    (number:Int) -> Int in
    let result = 3 * number
    return result
    }
)

class Shape {
    var numberOfSides = 0;
    var name: String;
    init(name: String){
        self.name = name;
    }
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides"
    }
}
var shape = Shape(name: "fjadlk");
shape.numberOfSides = 7;
var shapeDescription = shape.simpleDescription();

class NamedShape{
    var numberOfSides : Int = 0
    var name: String;
    
    init(name: String){
        self.name = name;
    }
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 4;
    }
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of lenght\(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "My test")
test.area()
test.simpleDescription()



class Circle: NamedShape {
    var banjin: Double
    
    init(banjin:Double , name:String)
    {
        self.banjin=banjin
        super.init(name:name)
        numberOfSides = 10000000
    }
    func area() ->Double{
        return banjin * banjin
    }
    override func   simpleDescription() -> String {
        return "A circle with .."
    }
}

class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double ,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter : Double {
        get {
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        
        return "An equilateral triangle with sides of length."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter=9.9
triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square{
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double,name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int,numberOfTimes times:Int)
    {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes : 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sidelength = optionalSquare?.sideLength

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four , Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Jack
let aceRawValue = ace.rawValue
let aceHashValue = ace.hashValue

if let convertedRank = Rank(rawValue: 12){
    let threeDescription = convertedRank.simpleDescription()
    convertedRank
}

enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String{
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        
        }
    }
    func color() ->String{
        switch self {
        case .Spades,.Clubs:
            return "black"
        case .Diamonds,.Hearts:
            return "red"
        }
        
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit:  .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}







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
