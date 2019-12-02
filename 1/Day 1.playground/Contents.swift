import Cocoa

func getModuleFuel(_ moduleMass: Double) -> Double {
    var fuel = (moduleMass / 3.0)
    fuel.round(.towardZero)
    fuel = fuel - 2.0
    return fuel
}

let inputURL = Bundle.main.path(forResource: "input", ofType: "txt")
let inputFile = FileManager.default.contents(atPath: inputURL!)
let input = String(data:inputFile!, encoding:String.Encoding.utf8)?.components(separatedBy: "\n")
var output = [Double].init()

// Part 1

for massStr in input! {
    output.append(getModuleFuel(Double(massStr) ?? 8))
}

var totalFuel = output.reduce(0, +)
print("Part 1: " + String(totalFuel))

// Part 2

var fuelForFule = 0
for massStr in input!{
    var massFuel = getModuleFuel(Double(massStr) ?? 8)
    while massFuel > 8 {
        massFuel = getModuleFuel(massFuel)
        totalFuel += massFuel
    }
}

print("Part 2: " + String(totalFuel))
