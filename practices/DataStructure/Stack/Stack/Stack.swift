//
//  ArrayStack.swift
//  ArrayStack
//
//  Created by Doliant on 2021/9/14.
//

import Foundation

protocol Stack {
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    var size: Int { get }
    
    var peek: Element? { get }
    
    mutating func push(newElement: Element) -> Bool
    
    mutating func pop() -> Element?
}

class StackWithArray: Stack {
    
    private var container: [Int] = []
    

    var isEmpty: Bool {
        return container.isEmpty
    }
    
    var size: Int {
        return container.count
    }
    
    var peek: Int? {
        return container.last
    }
    
    func pop() -> Int? {
        return container.removeLast()
    }
    
    func push(newElement: Int) -> Bool {
        container.append(newElement)
        return true
    }
    
}
