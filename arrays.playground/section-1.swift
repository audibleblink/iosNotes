// Playground - noun: a place where people can play

import UIKit

let toDos: [String] = ["take out garbage", "pay bills", "cross of finished items"]
toDos.isEmpty

var temp: [String] = []

for var i = toDos.count - 1; i >= 0; i-- {
    temp.append(toDos[i])
}

println("Array is reversed correctly... \(toDos.reverse() == temp)")


