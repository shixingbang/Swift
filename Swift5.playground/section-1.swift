// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

class Person {
    var residence: Residence?
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    subscript(i: Int) ->Room{
        return rooms[i]
    }
    func printNumberOfRooms(){
        println("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name:String
    
    init(name: String)  {
        self.name = name
    }
}

class Address{
    var buildingName: String?
    var buildingNumber: String?
    var street : String?
    func buildingIdentifier() -> String?{
        if (buildingName != nil){
            return buildingName
        }
        else if (buildingNumber != nil){
            return buildingNumber
        }
        else{
            return nil
        }
    }
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms{
    println("John's residence has \(roomCount) room(s)")
}else{
    println("Unable to retrieve the number of rooms.")
}
//

if (john.residence?.printNumberOfRooms() != nil){
    println("It was possible to print the number of rooms.")
}

var res = Residence()
let r1 = Room(name:"room1")
let r2 = Room(name: "room2")
res.rooms = [r1, r2 ]
res.rooms[0]
//
//if let firstRoomName = res[0].name{
//    println("the fist room name is\(firstRoomName)")
//}else {
//    println("Unable to retrieve the first room name.")
//}

//let johnHouse = Residence()
//johnHouse.rooms += Room(name: "living Room")
//johnHouse.rooms += Room (name: "Kitchen")
//john.residence = johnHouse

if let johnsStreet = john.residence?.address?.street{
    println("John's street nmae is \(johnsStreet)")
}else {
    println("Unable to retrieve the address")
}

class MediaItem {
    var name: String
    init(name: String){
        self.name = name
    }
}

class Movie: MediaItem{
    var director: String
    init(name: String, director: String){
        self.director = director
        super.init(name : name)
    }
}

class Song : MediaItem{
    var artist: String
    init(name: String, artist: String){
        self.artist = artist
        super.init(name :name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie{
        ++movieCount
    }
    else if item is Song{
        ++songCount
    }
}
println("Media library contains \(movieCount) movies and \(songCount) songs")

for item in library{
    if let movie = item as? Movie{
        println("Movie: '\(movie.name)',dir.\(movie.director)'")
    }else if let song = item as? Song{
        println("Song: '\(song.name)', by \(song.artist)'")
    }
}

let someObjects: [AnyObject] = [
    Movie(name: "2001 : A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

//let p : AnyObject = 1

for object in someObjects {
    let movie = object as Movie
//    println("Movie: '\(movie.name)', dir.\(movie.director)'")
}

for movie in someObjects as [Movie]{
//    println("Movie: '\(movie.name)', dir. \(movie.director)'")
}

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.1415926)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))


for thing in things {
    switch thing {
    case 0 as Int:
        println("zero as an Int")
    case 0 as Double:
        println("zero as a Double")
    case let someInt as Int:
        println("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        println("a positive double value of \(someDouble)")
    case is Double:
        println("some other double value that I don't want to print")
    case let someString as String:
        println("a string value of \"\(someString)\"")
    case let (x,y) as (Double, Double):
        println("an (x,y) point at \(x), \(y)")
    case let movie as Movie:
        println("a movie called '\(movie.name)', dir. \(movie.director)'")
    default :
        println("some thing else")
    }
}

struct BlackjackCard {
    enum Suit: Character {
        case Spades = "1", Heart = "2", Diamonds = "3", Clubs = "4"
    }
    enum Rank: Int {
        case Two = 2,Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, Ace, King
        struct Values{
            let first: Int, second: Int?
        }
//        结构体里嵌套个枚举，枚举里又嵌套个结构体我也是醉了。。
        var values: Values{
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second{
            output += "or \(second)"
        }
        return output
    }
}

extension Double {
    var km: Double { return self * 1_000}
    var m : Double { return self }
    var cm: Double { return self / 100.0}
    var mm: Double { return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let OneInch = 25.4.mm
let threeFeet = 3.ft
//extension Int {
//    var ft: Double { return self / 2.222}
//}

let aMarathon = 42.km + 195.m

struct Size {
    var width = 0.0 , height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var stize = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), stize: Size(width: 5.0, height: 5.0))

//extension Rect {
//    init(center: Point, size: Size){
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY),size: size);)
//    }
//}
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

extension Int{
    func repetitions(task:() ->()){
        for i in 0..<self{
            task()
        }
    }
}
//3.repetitions{
//    println("Goodbye!")
//}

extension Int{
    mutating func square(){
        self = self * self
    }
}
var someInt = 3
someInt.square()

extension Int {
    subscript (digitIndex: Int) ->Int {
        var decimalBase = 1
        for _ in 1...digitIndex{
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[1]

//extension Character {
//    enum Kind{
//        case Vowel, Consonant, Other
//    }
//    var kind: Kind{
//        switch String(self).lowercaseString{
//            case "a", "e", "i", "o" , "u":
//            return .Vowel
//            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
//            "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
//            return .Consonant
//        default :
//            return .Other
//        }
//    }
//}
//func printLetterKinds (word: String){
//    println("'\\(word)' is made up of the following kinds of letters:")
//    for character in word{
//        switch character.kind{
//        case .Vowel:
//            print("vowel")
//        case .Consonant:
//            print("consonant")
//        case .Other:
//            print("other")
//        }
//    }
//    print("\n")
//}
//println("FD")
//printLetterKinds("H")

protocol FullyNamed{
    var fullName: String { get }
}
struct Person2: FullyNamed {
    var fullName : String
}
let john2 = Person2(fullName:  "John Appleaseed")

class Starship : FullyNamed {
    var prefix: String?
    var name :String
    init(name: String ,prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        if (prefix != nil){
            return prefix! + " : " + name
        }
        else{
            return name
        }
    }
}
var ncc1701 = Starship(name: "Enterprise" , prefix: "USS")

protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double{
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

protocol Togglabel{
    mutating func toggle()
}

enum OnOffSwitch: Togglabel{
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = On
        case .On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator : RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int(generator.random() * Double(sides) + 1)
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
d6.roll()
for _ in 1...5{
    println("Random dice roll is \(d6.roll())")
}







//protocol DiceGame{
//    var dice: Dice{get}
//    func play()
//}
//protocol DiceGameDelegate{
//    func gameDidStart(game: DiceGame)
//    func game(game: DiceGame,didStartNewTurnWithDiceRoll diceRoll: Int)
//    func gameDidEnd(game: DiceGame)
//}
//
//
//class SnakesAndLadders: DiceGame {
//    let finalSquare = 25
//    let dic = Dice(sides: 6, generator: LinearCongruentialGenerator())
//    
//    var square = 0
//    var board: [Int]
//    init(){
//        board = [Int](count: finalSquare + 1, repeatedValue: 0)
//        board[03] = +08; board[06] = +11;board[09] = +09;board[10] = +02
//        board[14] = -10; board[19] = -11;board[22] = -02;board[24] = -08
//    }
//    
//    var delegate: DiceGameDelegate?
//    func play() {
//        square = 0
//        delegate?.gameDidStart(self)
//        gameLoop: while square != finalSquare{
//            let diceRoll = dice.roll()
//            delegate?.game(self,didStartNewTurnWithDiceRoll: diceRoll)
//            
//            switch square + diceRoll {
//            case finalSquare:
//                break gameLoop
//            case let newSquare where newSquare > finalSquare:
//                continue gameLoop
//            default:
//                square += diceRoll
//                square += board[square]
//            }
//        }
//        delegate?.gameDidEnd(self)
//    }
//}
//
//
//
//class DiceGameTracker: DiceGameDelegate{
//    var numberOfTurns = 0
//    func gameDidStart(game : DiceGame){
//        numberOfTurns = 0
//        if game is SnakesAndLadders {
//            println("Started a new game of Snakes and Ladders")
//        }
//        println("The game is using a \(game.dice.sides) - sided dice")
//    }
//    
//    func game(game: DiceGame, disStartNewTurnWidthDiceRoll diceRoll: Int){
//        ++numberOfTurns
//        println("Rolled a \(diceRoll)")
//    }
//    func gameDidEnd(game: DiceGame) {
//        println("The game lasted fo \(numberOfTurns) turns")
//    }
//}
//
//let tracker = DiceGameTracker()
//let game = SnakesAndLadders()
//game.delegate = tracker
//game.play()
//
//protocol TextRepresentable {
//    func asText() -> String
//}
//extension Dice: TextRepresentable {
//    func asText() -> String {
//        return "A \(sides) -sided dice"
//    }
//}
//let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
//println(d12.asText())

//struct Hamster {
//    var name: String
//    func asText() -> String{
//        return "A hamster named \(name)"
//    }
//}
//extension Hamster: TextRepresentable {}
//let simonTheHamster = Hamster(name: "Simon")
//let somethingTextRepresentable: TextRepresentable = simonTheHamster
//println(somethingTextRepresentable.asText())
//
//let things: [TextRepresentable] = [game,d12,simonTheHamster]
//protocol PrettyTextRepresentable: TextRepresentable{
//    func asPrettyText() -> String
//}
//
protocol Named{
    var name: String{get}
}
protocol Aged{
    var age: Int{get}
}
struct Person: Named,Aged{
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>){
    println("Happy birthday \(celebrator.name) - you're \(celebrator.age)")
}
let birthdayPerson = Person(name: "Malcolm", age:21)
wishHappyBirthday(birthdayPerson)

@objc protocol HasArea {
    var area: Double{get}
}

class Circle: HasArea{
    let pi = 3.1415927
    var radius: Double
    var area: Double
    init(radius: Double){
        self.radius = radius
    }
}
class Country: HasArea{
    var area: Double
    init(area: Double){
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int){
        self.legs = legs
    }
}
let objects: [AnyObject] =[
    Circle(radius: 2.0),
    Country(area: 243610),
    Animal(legs: 4)
]
for object in objects{
    if let objectWithArea = object as? HasArea{
        println("Area is \(objectWithArea.area)")
    }
    else{
        println("Something that does't have an area")
    }
}
println()
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
//
//
//
