//
//  ViewController.swift
//  swift初见
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //定义变量
    //创建一个常量，显式指定类型为 Float 并指定初始值为 4。
    let firstConst : Float = 4
    
    let label = "The width is"
    
    let width = 94
    
//    let widthLabel = label //属性初始化在实例创建前
//        + String(width)
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated);
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated);
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("hello world")
        
        let label = "The width is"
        
        let width = 94
        
//        let widthLabel = label + width 要显示转换
        
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        
     
        var num = myFirstFunc();
        
        print("\(num)")
        
//        使用方括号 [] 来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号。
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]//数组
        
        shoppingList[1] = "bottle of water"
        
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic",
            ]//字典
        occupations["Jayne"] = "Public Relations"
        
        
        let emptyArray = [String]()//数组
        
        
        let emptyDictionary = [String: Float]()//字典
        
        
        
//        使用 if 和 switch 来进行条件操作，使用 for-in、 for、 while 和 repeat-while 来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的。
        
        let individualScores = [75, 43, 103, 87, 12]
        
        var teamScore = 0
        
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        
        
        print(teamScore)
        
//        在 if 语句中，条件必须是一个布尔表达式——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地与 0 做对比。
      
//        你可以一起使用 if 和 let 来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是 nil 以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
        
        var optionalString: String? = "Hello"
        
        print(optionalString == nil)
        
        
        
        var optionalName: String?
        var greeting = "Hello!"
        
//        把 optionalName 改成 nil，greeting会是什么？添加一个 else 语句，当 optionalName 是 nil 时给 greeting 赋一个不同的值。
        
        if let name = optionalName {
            
            greeting = "Hello, \(name)"
            
            print(greeting)
            
        }else {
            
            
            print("为空")
        }
        
        var lkb_name : String? = "600"
        
        guard let tmp = lkb_name else {
            
            print("为空")
            
            return;
        }
        
        
        let nickName: String? = nil
        
        let fullName: String = "John Appleseed"
        
        let informalGreeting = "Hi \(nickName ?? fullName)"
        
        print(informalGreeting)
        
//        switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
   
        let vegetable = "red pepper"
//        "cucumber,watercress"
//        "red pepper"
        
        
        
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        
        
        
        
        
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3,995, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        
//        添加另一个变量来记录最大数字的种类(kind)，同时仍然记录这个最大数字的值。
        var largest = 0
        
        var otherLargestKind : Any?
        
        //元组
        for (kind, numbers) in interestingNumbers {
            
            for number in numbers {
                if number > largest {
                    largest = number
                    otherLargestKind = kind;
                }
            }
        }
        
        
        print(largest)
        
        print(otherLargestKind!)
        
        
        
        
        
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat {//do
            
            m = m * 2
            
        } while m < 100
        print(m)
        
        
        var total = 0
        for i in 0..<4 {
            
            total += i
            
        }
        print(total)
        
        func greet(person: String, day: String , eat: String) -> String {
            return "Hello \(person), today is \(day).eat is \(eat)"
        }
       print (greet(person:"Bob", day: "Tuesday",eat: "吃饭"))
        
        func greet2(_ person: String, on day: String) -> String {
            return "Hello \(person), today is \(day)."
        }
//        greet2("John", on: "Wednesday")
        
        greet2("dasda", on: "five")
        
//        使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
        func call(name : String ) -> Int {
            
            
            return 3
        }
        //传入数组 返回元组
        func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
            var min = scores[0]
            var max = scores[0]
            var sum = 0
            
            for score in scores {
                if score > max {
                    max = score
                } else if score < min {
                    min = score
                }
                sum += score
            }
            
            return (min, max, sum)
        }
        let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.2)//越界直接不会出现
        
        
//        函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
        func sumOf(numbers: Int...) -> Int {
            var sum = 0
            for number in numbers {
                sum += number
            }
            return sum
        }
        sumOf()
        sumOf(numbers: 42, 597, 12)
        
//        函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
        func returnFifteen() -> Int {
            var y = 10
            func add() {
                y += 5
            }
            add()
            return y
        }
        returnFifteen()
        
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        var increment = makeIncrementer()
        increment(7)
        
        
        //函数也可以当做参数传入另一个函数。
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }
        var numbers = [20, 19, 7, 12]
        hasAnyMatches(list: numbers, condition: lessThanTen)
        
        
        
        //{} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
        numbers.map(
            {
            (number: Int) -> Int in
            let result = 3 * number
            return result
        }
        
        )
        
        
        //有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个代理的回调，你可以忽略参数，返回值，甚至两个都忽略。单个语句闭包会把它语句的值当做结果返回。
        
        
        let mappedNumbers = numbers.map({ number in 3 * number })
        
        
        print(mappedNumbers)
        
        //你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
        
        let sortedNumbers = numbers.sorted { $0 > $1 }
        
        print(sortedNumbers)
        
        
        //使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样，唯一的区别就是它们的上下文是类。同样，方法和函数声明也一样。
        
        class Shape {
            
            var numberOfSides = 0
            
            func simpleDescription() -> String {
                print("我被调用了")
                
                return "A shape with \(numberOfSides) sides."
            }
        }
        
        Shape().simpleDescription()
//       使用 let 添加一个常量属性，再添加一个接收一个参数的方法。
        
//        let cont: Int = ()->Int{
//
//
//
//            return 3;
//        }
//
//        print(cont)
        
        class NamedShape {
            
            var numberOfSides: Int = 0
            
            var name: String
            
            init(name: String) {
                self.name = name
            }
            
            func simpleDescription() -> String {
                return "A shape with \(numberOfSides) sides."
            }
            
            deinit {
                
//                print("结束")
            }
        }
        
        NamedShape(name: "dasdd").simpleDescription()
        
//        。每个属性都需要赋值——无论是通过声明（就像 numberOfSides）还是通过构造器（就像 name）。
        
//        如果你需要在删除对象之前进行一些清理工作，使用 deinit 创建一个析构函数。
        
//        子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以根据需要添加或者忽略父类。
        
        
//        子类如果要重写父类的方法的话，需要用 override 标记——如果没有添加 override 就重写父类方法的话编译器会报错。编译器同样会检测 override 标记的方法是否确实在父类中。
        
        
        class Square: NamedShape {
            var sideLength: Double
            
            init(sideLength: Double, name: String) {
                self.sideLength = sideLength
                super.init(name: name)
                numberOfSides = 4
            }
            
            func area() ->  Double {
                return sideLength * sideLength
            }
            
            override func simpleDescription() -> String {
                return "A square with sides of length \(sideLength)."
            }
        }
        let test = Square(sideLength: 5.2, name: "my test square")
        test.area()
        test.simpleDescription()
        
        ///////////////////////////////////////////////////////////////
        
        class EquilateralTriangle: NamedShape {
            var sideLength: Double = 0.0
            
            init(sideLength: Double, name: String) {
                self.sideLength = sideLength
                super.init(name: name)
                numberOfSides = 3
            }
            // get 和 set
            var perimeter: Double {
                get {
                    return 3.0 * sideLength
                }
                set {
                    sideLength = newValue / 3.0
                }
            }
            
            override func simpleDescription() -> String {
                return "An equilateral triangle with sides of length \(sideLength)."
            }
        }
        var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
        print(triangle.perimeter)
        triangle.perimeter = 9.9
        print(triangle.sideLength)
        
        
        
//        如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet。写入的代码会在属性值发生改变时调用，但不包含构造器中发生值改变的情况。比如，下面的类确保三角形的边长总是和正方形的边长相同。
        
        class TriangleAndSquare {
            var triangle: EquilateralTriangle {
                willSet {
                    square.sideLength = newValue.sideLength
                }
                
                didSet {
                    
                    
                    print("我被调用了")
                    
                }
            }
            var square: Square {
                willSet {
                    triangle.sideLength = newValue.sideLength
                }
            }
            init(size: Double, name: String) {
                square = Square(sideLength: size, name: name)
                triangle = EquilateralTriangle(sideLength: size, name: name)
            }
        }
        var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
        print(triangleAndSquare.triangle.sideLength)
        
        
        
        //
        enum Rank: Int {
            case ace = 1
            case two, three, four, five, six, seven, eight, nine, ten
            case jack, queen, king
            
            func simpleDescription() -> String {
                switch self {
                case .ace:
                    return "ace"
                case .jack:
                    return "jack"
                case .queen:
                    return "queen"
                case .king:
                    return "king"
                default:
                    return String(self.rawValue)
                }
                
            }
            
        }
        let ace = Rank.ace
        let aceRawValue = ace.rawValue
        
        //
        enum ServerResponse {
            case result(String, String)
            case failure(String)
        }
        
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("Out of cheese.")
        
        switch success {
        case let .result(sunrise, sunset)://有值
            print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
        case let .failure(message):
            print("Failure...  \(message)")
        }
        
        enum Suit {
            case spades, hearts, diamonds, clubs
            func simpleDescription() -> String {
                switch self {
                case .spades:
                    return "spades"
                case .hearts:
                    return "hearts"
                case .diamonds:
                    return "diamonds"
                case .clubs:
                    return "clubs"
                }
            }
        }
        let hearts = Suit.hearts
        let heartsDescription = hearts.simpleDescription()
        
        //使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
        
        struct Card {
            
            var rank: Rank
            
            var suit: Suit
            
            func simpleDescription() -> String {
                
                return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
                
            }
        }
        
        let threeOfSpades = Card(rank: .three, suit: .spades)
        
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
       
        
      
        
        //注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。
        class SimpleClass: ExampleProtocol {
            var simpleDescription: String = "A very simple class."
            var anotherProperty: Int = 69105
            func adjust() {
                simpleDescription += "  Now 100% adjusted."
            }
        }
        var a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription
        
        ///注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。
        struct SimpleStructure: ExampleProtocol {
            var simpleDescription: String = "A simple structure"
            mutating func adjust() {
                simpleDescription += " (adjusted)"
            }
        }
        var b = SimpleStructure()
        b.adjust()
        let bDescription = b.simpleDescription
        
        
        ///
        
        print(7.simpleDescription)
        
        
        //你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用。
        
        let protocolValue: ExampleProtocol = a
        print(protocolValue.simpleDescription)
//         print(protocolValue.anotherProperty)  // 去掉注释可以看到错误
        
        
        //
        enum PrinterError: Error {
            
            case outOfPaper
            
            case noToner
            
            case onFire
            
        }
        
        
//        使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码会进行错误处理。
        
        func send(job: Int, toPrinter printerName: String) throws -> String {
            if printerName == "Never Has Toner" {
                throw PrinterError.noToner
            }
            return "Job sent"
        }
        
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
            
            print(printerResponse)
            
        } catch {
            print(error)
        }
        
        
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        
        
//        另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil。否则的话，结果会是一个包含函数返回值的可选值。
        
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        
        
//        使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用 defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同。
        
        var fridgeIsOpen = false
        let fridgeContent = ["milk", "eggs", "leftovers"]
        
        func fridgeContains(_ food: String) -> Bool {
            fridgeIsOpen = true
            defer {
                fridgeIsOpen = false
            }
            
            let result = fridgeContent.contains(food)
            return result
        }
        
        fridgeContains("banana")
        
        print(fridgeIsOpen)
        
        
        //
//        泛型
//        在尖括号里写一个名字来创建一个泛型函数或者类型。
        
        func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
            var result = [Item]()
            
            for _ in 0..<numberOfTimes {
                
                result.append(item)
                
            }
            return result
        }
        
        repeatItem(repeating: "knock", numberOfTimes:4)
        
        
        
        //
//        你也可以创建泛型函数、方法、类、枚举和结构体。
        
        // 重新实现 Swift 标准库中的可选类型
        enum OptionalValue<Wrapped> {
            case None
            case Some(Wrapped)
        }
        var possibleInteger: OptionalValue<Int> = .None
        
        possibleInteger = .Some(100)
        
        
        //
//        在类型名后面使用 where 来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。
        
        func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
            where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
                for lhsItem in lhs {
                    for rhsItem in rhs {
                        if lhsItem == rhsItem {
                            return true
                        }
                    }
                }
                return false
        }
        anyCommonElements([1, 2, 3], [3])
        
        
        
        
//        self.navigationController?.pushViewController(FirstVC(), animated: true)
        
        
        
        
        
        
        
        
        
        
        
    }
    
    func myFirstFunc() -> Int {
        
        
        return 3
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.present(FirstVC(), animated: true) {
            
            print("我被推出来了")
            
        }
        
    }

}


//协议
protocol ExampleProtocol {
    
    var simpleDescription: String { get }
    
    
    mutating func adjust()
    
}


//使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型。

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
















