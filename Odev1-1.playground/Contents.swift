import UIKit

//Kişi bilgileri
var name: String = "Abdulkadir"
var surname: String = "Oruç"
var age: Int = 23
var height: Double = 1.73
var isMarried: Bool = false

var address: String? = nil

if let safeAddress = address {
    print("Adres: \(safeAddress)")
} else {
    print("Adres bilgisi yok.")
}

print("Ad: \(name)")
print("Yaş: \(age)")
print("Boy: \(height) m")
print("Evli: \(isMarried ? "Evet" : "Hayır")")

//Hesap makinesi
func add(a: Double, b: Double) -> Double {
    return a + b
}

func subtract(a: Double, b: Double) -> Double {
    return a - b
}

func multiply(a: Double, b: Double) -> Double {
    return a * b
}

func divide(a: Double, b: Double) -> Double? {
    guard b != 0 else { return nil }
    
    return a / b
}

let resultAdd = add(a: 5, b: 3)
let resultSubtract = subtract(a: 5, b: 3)
let resultMultiply = multiply(a: 5, b: 3)
let resultDivide = divide(a: 5, b: 3)

print("Toplama: \(resultAdd)")
print("Çıkarma: \(resultSubtract)")
print("Çarpma: \(resultMultiply)")
if let result = resultDivide {
    print("Bölme: \(result)")
} else {
    print("Bölme hatası")
}

//Closure filtreleme, sıralama
let numbers = [1, 2, 3, 4, 5]

let filterEvenNumbers: (Int) -> Bool = { number in
    return number % 2 == 0
}
let sortdescending: (Int, Int) -> Bool = { a, b in
    return a > b
}

let evenNumbersSorted = numbers.filter(filterEvenNumbers).sorted(by: sortdescending)

print(evenNumbersSorted)



