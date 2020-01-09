//
//  main.swift
//  PointersExample
//
//  Created by Soni Suman on 09/01/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import Foundation

//scaler value
let memSimple = MemoryLayout<Int32>.self
memSimple.size
memSimple.stride
memSimple.alignment


//complex value

struct Gameboard {
    var p1Score: Int32
    var p2Score: Int32
    var gameOver: Bool
    
}

MemoryLayout<Int32>.size
MemoryLayout<Bool>.size
let memComplex = MemoryLayout<Gameboard>.self
memComplex.size
memComplex.stride
memComplex.alignment

//c strings
let count = 4
let stride = MemoryLayout<CChar>.stride
let aligment = MemoryLayout<CChar>.alignment
let byteCount = stride * count

let mutableRawPtr = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: aligment)
defer {
    mutableRawPtr.deallocate()
}

mutableRawPtr.storeBytes(of: 76, as: CChar.self)
mutableRawPtr.advanced(by: stride).storeBytes(of: 117, as: CChar.self)
mutableRawPtr.advanced(by: stride * 2).storeBytes(of: 99, as: CChar.self)
mutableRawPtr.advanced(by: stride * 3).storeBytes(of: 0, as: CChar.self)

let rawBufferPointer = UnsafeRawBufferPointer(start: mutableRawPtr, count: byteCount)

for (index,byte) in rawBufferPointer.enumerated() {
    print("\(index): \(byte)")
}
let mutablePtr = mutableRawPtr.bindMemory(to: CChar.self, capacity: count)

print(String(cString: mutablePtr))

//Reading from stdIn

let inputCapacity = 30
let input = UnsafeMutablePointer<CChar>.allocate(capacity: inputCapacity)

defer {
    input.deallocate()
}

print("Enter text: ",terminator: "")
fgets(input, Int32(inputCapacity), stdin)
print(String(cString: input))


////GameBoard
//let gameBoardPtr = UnsafeMutablePointer<GameBoard>.allocate(capacity: 1)
//gameBoardPtr.initialize(to: GameBoard(p1Score: 20, p2Score: 1))
//
//defer {
//    gameBoardPtr.deinitialize(count: 1)
//    gameBoardPtr.deallocate()
//}
var gameBoard =  GameBoard(p1Score: 20, p2Score: 1)
if let gameText = CreateCurrentScoreText(&gameBoard) {
    print(String(cString: gameText))
    gameText.deallocate()
}

//Notes: Pointers: -  8 types

//Mutable ->
//1)UnsafeMutablePointer
//2)UnsafeMutableRawPointer
//3)UnsafeMutableBufferPointer
//4)UnsafeMutableRawBufferPointer

//Immutable
//1)UnsafePointer
//2)UnsafeRawPointer
//3)UnsafeBufferPointer
//4)UnsafeRawbufferPointer

//Mutable - Content can change
//Raw - Only understands byte addessable changes
//Buffer - Treats pointer content as an array

