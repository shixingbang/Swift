// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level : Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level : Int)->Bool{
        if LevelTracker.levelIsUnlocked(level){
            currentLevel = level
            return true
        }
        else{
            return false
        }
    }
}
class Player {
    var tracker = LevelTracker()
    let playerName: String = ""
    func completedLevel(level: Int){
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name:String){
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
player = Player(name: "Beto")
if player.tracker.advanceToLevel(6)
{
    println("player is now on level 6")
}
else{
    println("level 6 has not yet been unlocked")
}


//subscript(index: Int) ->Int{
//    get{
//        return index + 1;
//    }
//    set(newValue){
//        
//    }
//}

struct TimesTable{
    let multiplier: Int = 0
    subscript(index: Int)->Int{
        return multiplier * index
    }
//    init(a:Int){
//        multiplier = a
//    }
}
let threeTimesTabel = TimesTable()
println((threeTimesTabel[6]))
TimesTable()
func TimesBy(a:Int,b:Int) ->Int{
    return a * b
}
TimesBy(2, 3)

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows*columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int,column: Int) ->Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript (row: Int, column: Int) ->Double
        {
        get{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            grid[(row * columns) + columns] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 2.0
matrix[1, 0]
//matrix[0 , 1] = 1.5
//matrix[1 , 0] = 3.2


class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() ->String{
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init(){
        numberOfWheels = 0
        maxPassengers = 1
    }
}
let someVehicle = Vehicle()

class Bicycle: Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
println("Bicycle: \(bicycle.description())")
class Tandem: Bicycle{
    override init()
    {
        super.init()
        maxPassengers = 2
    }
}

let tandem = Tandem()
println("Tandem: \(tandem.description())")

class Car: Vehicle{
    var speed : Double = 0.0
   override init(){
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
        
    }
    override  func description() -> String {
        return super.description() + ";" + "traveling at \(speed) mph"
    }
}
let car = Car()
println("Car : \(car.description())")

class SpeedLimitedCar: Car{
    override var speed: Double{
        get{
            return super.speed
        }
        set{
            super.speed = min(newValue, 40.0)
        }
    }
}
let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
println("SpeedLimitedCar: \(limitedCar.description())")

class AutoMaticCar: Car{
    var gear = 1
    override var speed : Double{
        didSet{
            gear = Int(speed/10.0) + 1
        }
    }
    override func description() ->String{
        return super.description() + " in gear \(gear)"
    }
}
let automatic = AutoMaticCar()
automatic.speed = 35.0
println("AutomaticCar: \(automatic.description())")

struct Fahrenheit {
    var temperature: Double
    init(){
        temperature = 32.0
    }
}
var f = Fahrenheit()

struct Celsius{
    var temperatueInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double){
        temperatueInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double){
        temperatueInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color{
    let red = 0.0, green = 0.0, blue = 0.0
    init(red: Double, green: Double, blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

class SurveyQuestion{
    let text: String
    var response: String?
    init(text:String){
        self.text = text
    }
    func ask()
    {
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"

class ShoppingListItem{
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

struct Size{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x: originX, y: originY),size: size)
        
    }
}
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10{
            for j in 1...10{
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) ->Bool{
        return boardColors[(row * 10) + column]
    }
}

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCointsToVend: Int)->Int{
        numberOfCointsToVend = min(numberOfCointsToVend, coinsInBank)
        coinsInBank -= numberOfCointsToVend
        return numberOfCointsToVend
    }
    static func receiveCoins(coins: Int){
        coinsInBank += coins
    }
}

class Player2 {
    var coinsInPurse: Int
    init(coins: Int){
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int){
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit{
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne : Player2? = Player2(coins: 100)
playerOne!.coinsInPurse
Bank.coinsInBank
playerOne!.winCoins(2000)

Bank.coinsInBank
playerOne = nil

println(Bank.coinsInBank)

class Person {
    let name: String
    init(name:String){
        self.name = name
        println("\(name) is being initialized")
    }
    deinit{
        println("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference2
reference1 = nil
reference2 = nil
reference3 = nil


//class HTMLElement {
//    let name: String
//    let text: String?
//    lazy var asHTML :() ->String = {
//        if let text = self.text{
//            return "<\(self.name) <\(text)</ \(self.name)>"
//        }
//        else{
//            return "<\(self.name) />"
//        }
//    }
//    init(name: String, text:String? = nil){
//        self.name = name
//        self.text = text
//    }
//    deinit{
//        println("\(name) is being deinitialized")
//    }
//}
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//println(paragraph!.asHTML())

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] ()  in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)"
        }
        else{
            return "<\(self.name)"
        }
    }
    
    init(name : String, text: String? = nil)
    {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized)")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p" , text:"hello,world")
println(paragraph!.asHTML())
paragraph = nil


class Person3 {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john2 = Person3()
//let roomCount = john2.residence!.numberOfRooms

john2.residence?.numberOfRooms = 2

if let roomCount = john2.residence?.numberOfRooms{
    println("John's residence has \(roomCount) room(s).")
}else {
    println("Unable to retrieve the number of rooms.")
}

let john3 = Person3()
john3.residence = Residence()
john3.residence?.numberOfRooms = 3
if let roomCount = john3.residence?.numberOfRooms{
    println("John's residence has \(roomCount) room(s)")
}else {
    println("Unable to retrieve the number of rooms")
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
//
//
//
//
//
//
