//
//  main.swift
//  Lottery
//
//  Created by Br7 on 2022/1/11.
//

import Foundation

print("電腦開始選號....")

// Ｖariable declaration ＆ initialize
var computerRandom6: [Int] = []
var computerRandomUnique6: [Int] = []
var comPick = 1

// Process
print("電腦選號完畢！！")
print("電腦選號六碼依序抽出：\(comRandom6()), 依大小排序後：\(computerRandomUnique6.sorted())")
print("<電腦選號> 請輸入要買幾組樂透：")
var userInput = readLine() ?? ""
var userInputInt = Int(userInput) ?? 1
pplRandom6(ar1: computerRandomUnique6, input: userInputInt)
