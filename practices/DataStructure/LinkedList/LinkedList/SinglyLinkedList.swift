//
//  SinglyLinkedList.swift
//  SinglyLinkedList
//
//  Created by Doliant on 2021/8/19.
//

import Foundation

class SinglyNode<T: Equatable> {
    var next: SinglyNode<T>?
    var value: T?
    
    init() {}
    
    init(_ value: T) {
        self.value = value
    }
}

extension SinglyNode: Equatable {
    static func == (lhs: SinglyNode<T>, rhs: SinglyNode<T>) -> Bool {
        return lhs.next === rhs.next && lhs.value == rhs.value
    }
}


class SinglyLinkedList<T: Equatable> {
    typealias Node = SinglyNode<T>
    
    private var dummyNode = SinglyNode<T>()
    
    var size: Int {
        var num = 0
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            num += 1
            tmpNode = tmpNode!.next
        }
        return num
    }
    
    var isEmpty: Bool {
        return size == 0
    }
    
    func insertToHead(_ node: Node) {
        node.next =  dummyNode.next
        dummyNode.next = node
    }
    
    func insert(before node: Node, with newNode: Node) -> Bool {
        var lastNode = dummyNode
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            if tmpNode === node {
                newNode.next = tmpNode!
                lastNode.next = newNode
                return true
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }
        return false
    }
    
    func insert(after node: Node, with newNode: Node) -> Bool {
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            if tmpNode === node {
                newNode.next = tmpNode!.next
                tmpNode?.next = newNode
                return true
            }
            tmpNode = tmpNode!.next
        }
        return  false
    }
    
    func node(withValue: T) -> Node? {
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            if tmpNode!.value == withValue {
                return tmpNode!
            }
            tmpNode = tmpNode!.next
        }
        return nil
    }
    
    // assume index start with 1
    func node(atIndex: Int) -> Node? {
        var tmpNode = dummyNode.next
        var num = 1
        while tmpNode != nil {
            if num == atIndex {
                return tmpNode!
            }
            tmpNode = tmpNode!.next
            num += 1
        }
        return nil
    }
    
    func delete(node: Node) -> Bool {
        var lastNode = dummyNode
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            if tmpNode === node {
                lastNode.next = tmpNode!.next
                return true
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }
        return false
    }
}
