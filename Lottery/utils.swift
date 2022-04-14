//
//  utils.swift
//  Lottery
//
//  Created by Br7 on 2022/1/11.
//

func comRandom6 () -> Array<Any> {
    repeat {
        comPick += 1
        computerRandom6.append(Int.random(in: 1...49))
        
        for value in computerRandom6 {
            if (computerRandomUnique6.contains(value)) {
                continue
            }
            computerRandomUnique6.append(value)
        }
    } while(computerRandomUnique6.count < 6)
    return computerRandomUnique6
}

func pplRandom6 (ar1: Array<Int>, input: Int) {
    
    var i = 0
    while i < input{
        i += 1
        
        var arrayBasket = [1]
        var balls = 1
        
        while balls <= 48{
            balls += 1
            arrayBasket.append(balls)
        }
        //print(array)
        var random7Balls: [Int] = []
        var pick = 1
        while pick <= 7 {
            pick += 1
            random7Balls.append(arrayBasket.remove(at: Int.random(in: 0..<arrayBasket.count)))
        }
        //print(random7Balls)
        let specialNum = random7Balls.remove(at: 6)
        random7Balls.sort()
        
        print("#\(i<10 ? "0": "" )\(i), 隨機六碼為：\(random7Balls), 特別號為：[\(specialNum)]\n\(checkArray(ar1: ar1, ar2: random7Balls, sp: specialNum))")
    }
}

func checkArray(ar1: Array<Int>, ar2: Array<Int>, sp: Int) -> String {
    var list = Array<Int>()
    var set = Set<Int>()
    var spCheck: Bool = false

    for item in ar1 {
        set.insert(item)
    }

    for item in ar2 {
        if set.contains(item) {
            list.append(item)
        }
    }
    spCheck = computerRandomUnique6.contains(sp)
    
    let message1 = "你對中了\(list.count)碼：\(list), 且\(spCheck ? "中了特別號：[\(sp)]" : "沒中特別號。")\n"
    let message2 = checkPrize(ck1: list.count, ck2: spCheck).msg.appending("\n")

    return message1 + message2
}

func checkPrize(ck1: Int, ck2: Bool ) -> (msg: String, prize: Int) {
    var msg: String
    let prize = [100000000, 3000000, 30000, 10000, 2000, 1000, 400]
    var sum = 0
    
    switch ck1 {
    case 6:
        msg = "！！！恭喜你中了頭獎，你可以獲得 NTD$ \(prize[0]) 的獎金～"
        sum += prize[0]
    case 5:
        msg = "！！恭喜你中了\(ck2 ? "二獎" : "三獎")，你可以獲得 NTD$ \(ck2 ? "\(prize[1])" : "\(prize[2])") 的獎金～"
        sum += ck2 ? prize[1] : prize[2]
    case 4:
        msg = "！！恭喜你中了\(ck2 ? "四獎" : "五獎")，你可以獲得 NTD$ \(ck2 ? "\(prize[3])" : "\(prize[4])") 的獎金～"
        sum += ck2 ? prize[3] : prize[4]
    case 3:
        msg = "！恭喜你中了\(ck2 ? "六獎" : "普獎")，你可以獲得 NTD$ \(ck2 ? "\(prize[5])" : "\(prize[6])") 的獎金～"
        sum += ck2 ? prize[5] : prize[6]
    case 2:
        msg = "\(ck2 ? "！恭喜你中了七獎，你可以獲得 NTD$ \(prize[6]) 的獎金～" : "  抱歉，你沒有獲得任何獎金喔...")"
        sum += ck2 ? prize[6] : 0
        
    default:
        msg = "  抱歉，你沒有獲得任何獎金喔..."
        
    }
    return (msg, sum)
}
