class Node<T> {
    let value: T
    var next: Node<T>?
    weak var previous: Node<T>?

    init(_ value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T> {
    private var dummyNode = Node<T>()

    var size: Int {
        var num = 0
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            num += 1
            tmpNode = tmpNode!.next
        }
        return num
    }

    func insertToHead(node: Node<T>) {
        node.next = dummyNode.next
        node.previous = dummyNodev
        dummyNode.next.previous = node
        dummyNode.next = node
    }

    func insert(after node: Node<T>, newNode: Node<T>) {
        newNode.next = node.next
        newNode.previous = node
        node.next.previous = newNode
        node.next = newNode
    }

    func insert(before node: Node<T>, newNode: Node<T>) {
        var lastNode = dummyNode
        var tmpNode = dummyNode.next
        while tmpNode != nil {
            if tmpNode === node {
                newNode.next = tmpNode!
                newNode.previous = lastNode
                tmpNode!.previous = newNode
                lastNode.next = newNode
                break
            }
            lastNode = lastNode!.next
            tmpNode = tmpNode!.next
        }
    }

    func delete(node: Node<T>) {
        var lastNode = dummy
        var tmpNode = dummy.next
        var nextNode = dummy.next.next

        while tmpNode != nil {
            if tmpNode === node {
                if nextNode == nil {
                    lastNode.next = nil
                } else {
                    lastNode.next = nextNode!
                    nextNode.previous = lastNode!
                    tmpNode.next = nil
                    tmpNode.previous = nil
                }
                break
            }
            lastNode = lastNode!.next
            tmpNode = tmpNode!.next
            nextNode = nextNode?.next
        }
    }

    func node(with value: T) -> Node<T>? {

    }



}