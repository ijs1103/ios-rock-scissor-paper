//
//  main.swift
//  RockPaperScissors
//
//  Created by 이주상 on 2023/11/22.
//

import Foundation

outerLoop: while true {
    
    printChoice()
    
    guard let input = readLine(), let intInput = Int(input) else {
        printBadInput()
        continue
    }
    
    switch intInput {
        
    case 1, 2, 3:
        let result = calcResult(with: intInput)
        print(result.rawValue)
        switch result {
        case .win, .lose:
            printGameExit()
            break outerLoop
        default:
            break
        }
        
    case 0:
        printGameExit()
        break outerLoop
        
    default:
        printBadInput()
    }
}

private func calcResult(with input: Int) -> Result {
    
    let randomInt = Int.random(in: 1...3)
    
    let diff = randomInt - input
        
    if diff == 0 {
        return .draw
    }
    
    if [-1, 2].contains(diff) {
        return .lose
    }
    
    if [1, -2].contains(diff) {
        return .win
    }
    
    return .none
}

private func printChoice() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
}

private func printGameExit() {
    print("게임 종료")
}

private func printBadInput() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}
