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
        return lhs.next == rhs.next && lhs.value == rhs.value
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
    
    // assume index start from 1
    func delete(index: Int) -> Bool {
        var num = 1
        var lastNode = dummyNode, currentNode = dummyNode.next
        while currentNode != nil {
            if num == index {
                lastNode.next = currentNode!.next
                return true
            }
            lastNode = currentNode!
            currentNode = currentNode!.next
            num += 1
        }
        return false
    }
    
    // delete revert index node
    func deleteFromBottom(reverseIndex: Int) -> Bool {
        let targetIndex = size - reverseIndex + 1
        return delete(index: targetIndex)
    }
    
    func deleteNthFromEnd(head: Node?, n: Int) -> Node? {
        var slow = head, fast = head, num = 0
        while fast != nil, num < n {
            fast = fast!.next
        }
        
        var prev: Node?
        while fast != nil {
            prev = slow
            slow = slow!.next
            fast = fast!.next
        }
        
        guard prev != nil else {
            slow = head?.next
            return slow
        }
        return head
    }
    
    
    func reverseNodeList(headNode: Node) -> Node? {
        var reverseHead: Node?, currentNode: Node?, prevNode: Node?
        currentNode = headNode
        while currentNode != nil {
            let nextNode = currentNode!.next
            if currentNode?.next == nil {
                reverseHead = currentNode
            }
            currentNode!.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
        }
        return reverseHead
    }
    
    func halfNode(in head: Node) -> Node? {
        var slowNode: Node? = head, fastNode: Node? = head
        while fastNode?.next != nil, fastNode?.next?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        return slowNode
    }
    
    func hasCircle(headNode: Node) -> Bool {
        var fastNode: Node?, slowNode: Node?
        slowNode = headNode
        fastNode = headNode.next
        while fastNode != nil {
            if slowNode == fastNode {
                return true
            }
            slowNode = slowNode!.next
            fastNode = fastNode!.next?.next
        }
        return false
    }
}

func mergeSortList<Element: Comparable>(headA: SinglyNode<Element>?, headB: SinglyNode<Element>?) -> SinglyNode<Element>? {
    guard let headA = headA else {
        return headB
    }
    
    guard let headB = headB else {
        return headA
    }
    
    var head: SinglyNode<Element>?, tail: SinglyNode<Element>?
    
    var nodeA: SinglyNode<Element>? = headA, nodeB: SinglyNode<Element>? = headB
    
    if nodeA!.value! < nodeB!.value! {
        head = nodeA
        nodeA = nodeA!.next
    } else {
        head = nodeB
        nodeB = nodeB!.next
    }
    tail = head
    
    while nodeA != nil, nodeB != nil {
        if nodeA!.value! < nodeB!.value! {
            tail?.next = nodeA
            nodeA = nodeA!.next
        } else {
            tail?.next = nodeB
            nodeB = nodeB!.next
        }
        tail = tail!.next
    }
    
    if nodeA != nil {
        tail?.next = nodeA
    } else {
        tail?.next = nodeB
    }
    return head
}
