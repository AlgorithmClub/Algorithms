//
//  Queue.swift
//  Stack
//
//  Created by Doliant on 2021/9/15.
//

import Foundation

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    var size: Int { get }
    
    var peek: Element? { get }
    
    mutating func enqueue(newElement: Element) -> Bool
    
    mutating func dequeue() -> Element?
}

struct ArrayQueue<Element>: Queue {
    
    private var inArray: [Element] = []
    private var outArray: [Element] = []
    
    var isEmpty: Bool {
        return inArray.isEmpty && outArray.isEmpty
    }
    
    var size: Int {
        return inArray.count + outArray.count
    }
    
    var peek: Element? {
        return outArray.isEmpty ? inArray.first : outArray.last
    }
    
    mutating func enqueue(newElement: Element) -> Bool {
        inArray.append(newElement)
        return true
    }
    
    mutating func dequeue() -> Element? {
        if outArray.isEmpty {
            outArray = inArray.reversed()
            inArray.removeAll()
        }
        return outArray.popLast()
    }
}
