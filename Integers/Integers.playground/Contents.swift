import Foundation

extension BinaryInteger {
    //Generate binary representations of integer
    //Ex :- UIInt16 -> 00000000 00000111
    var binaryDescription: String {
        return (0..<self.bitWidth).reduce("") {(result,index) -> String in
            let spacing = index % 8 == 0 ? " " : ""
            return "\((self >> index) & 1) \(spacing) \(result)"
        }
    }
    
    // Generate byte representation of integer
    // Ex. - UInt8(28) -> 1c  (hex)
    
    var byteDescriptions: String {
        let byteRange = 0..<(self.bitWidth / 8)
        return byteRange.reduce("") {
            (result,Index) -> String in
            String(format: "%02x %@", Int((self >> (Index * 8))) & 0xff, result)
        }
    }
}

let a = UInt8(200)
Int(a) + 100
0b1010
10
0x0A

UInt8(128).binaryDescription
Int8(-128).binaryDescription
Int8(127).binaryDescription

/*
 Note: -
 Decimal (Base 10)
 
 5            5 * 10ˆ0
 25           2 * 10ˆ1 + 5 * 10ˆ0
 
 Binary (base 2)
 0001 = 1   1* 2ˆ0
 0010 = 2   1*2ˆ1
 0100 = 4   1*2ˆ2
 1001 = 9   1*2ˆ3 + 1* 2ˆ0
 
 HexaDecimal  (Base 16)
 
 0X01 = 1    1* 16ˆ0
 0X0F = 15   15*16ˆ0
 0X10 = 16    1*16ˆ1
 0x1A = 26    1* 16ˆ1 +10*16ˆ0
 
 UInt8  0...255
 Int8  -128...127
 
 */

