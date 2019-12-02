import Cocoa

var str = "Hello, playground"
let inputURL = Bundle.main.path(forResource: "input", ofType: "txt")
let inputFile = FileManager.default.contents(atPath: inputURL!)
let input = String(data:inputFile!, encoding:String.Encoding.utf8)?.components(separatedBy: "\n")
var output = [Double].init()

for massStr in input! {
    var fuel = ((Double(massStr) ?? 8) / 3.0)
    fuel.round(.towardZero)
    fuel = fuel - 2.0
    output.append(fuel)
}

print(output.reduce(0, +))
