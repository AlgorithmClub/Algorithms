class Node<T> {
    var value: T
    var next: Node?

    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    // guard property
    private var dummy = Node<T>()

    var size: Int {
        var num = 0
        var tmpNode = dummy.next
        while tmpNode != nil {
            num += 1
            tmpNode = tmpNode!.next
        }
        return num
    }

    var isEmpty: Bool {
        return size == 0
    }

    func insertToHead(node: Node<T>) {
        node.next = dummy.next
        dummy.next = node 
    }

    func insert(after node: Node<T>, newNode: Node<T>) {
        newNode.next = node.next
        node.next = newNode
    }

    func insert(before node: Node<T>, newNode: Node <T>) {
        var lastNode = dummy
        var tmpNode = dummy.next
        while tmpNode != nil {
            if tmpNode === node {
                newNode.next = tmpNode!
                lastNode.next = newNode
                break
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }                        
    }

    func delete(node: Node<T>) {
        var lastNode = dummy
        var tmpNode = dummy.next
        while tmpNode != nil {
            if tmpNode === node {
                lastNode.next = tmpNode!.next
                break
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next            
        }
    }

    func node(with value: T) -> Node<T>? {
        var node = dummy.next
        while node != nil {
           if node!.value == value {
               return node!
           }
            node = node!.next
        }
        return nil
    }

    func node(with index: Int) -> Node<T>? {
        // linkedList index start with 1
        var num = 1
        var node = dummy.next
        while node != nil {
            if num == index {
                return node
            }
            node = node!.next
            num += 1
        }
        return nil
    }
}

func revertSingleLinkedList(headNode: Node<T>) -> Node<T> {
    var reverseHead: Node<T>?, currentNode: Node<T>, prevNode: Node<T>?
    currentNode = headNode
    while currentNode != nil {
        let nextNode = currentNode!.next
        if nextNode == nil {
            reverseHead = currentNode
        }
        currentNode.next = prevNode
        prevNode = currentNode
        currentNode = next
    }
    return prevNode
}
