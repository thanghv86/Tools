import UIKit

var greeting = "Hello, playground"
var numberFormatter: NumberFormatter = {
    var nf = NumberFormatter()
    nf.numberStyle = .none
    nf.zeroSymbol = ""
    return nf
}()
numberFormatter.minimumFractionDigits = 0 // default
print((numberFormatter.string(from: 123.456))!)
