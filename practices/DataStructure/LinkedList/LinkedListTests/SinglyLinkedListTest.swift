//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Doliant on 2021/8/19.
//

import XCTest

final class MergeLinkedListTest: XCTestCase {
    private var firstLinkedList = SinglyLinkedList<Int>()
    private var secondLinkedList = SinglyLinkedList<Int>()
    
    private let firstNode = SinglyNode(1)
    private let secondNode = SinglyNode(2)
    private let thirdNode = SinglyNode(3)
    private let fouthNode = SinglyNode(4)
    private let fifthNode = SinglyNode(5)
    
    override func setUp() {
        firstLinkedList.insertToHead(thirdNode)
        _ = firstLinkedList.insert(after: thirdNode, with: fouthNode)
        _ = firstLinkedList.insert(after: fouthNode, with: fifthNode)
        
        secondLinkedList.insertToHead(firstNode)
        _ = secondLinkedList.insert(after: firstNode, with: secondNode)
    }
    
    func test_GIVEN_twoSortedLinkedList_WHEN_callMergeLinkedList_THEN_returnTheRightHead() {
        let mergedListNode = mergeSortList(headA: firstLinkedList.node(atIndex: 1), headB: secondLinkedList.node(atIndex: 1))
        XCTAssertEqual(mergedListNode!, firstNode)
        XCTAssertEqual(mergedListNode!.next?.next?.next, fouthNode)
    }
    
    
}

final class SinglyLinkedListTest: XCTestCase {
    private var sut = SinglyLinkedList<Int>()
    private let firstNode = SinglyNode(1)
    private let beforeNode = SinglyNode(0)
    private let afterNode = SinglyNode(2)
    
    func test_GIVEN_emptyLinkedList_THEN_isEmpty() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_GIVEN_emptyLinkedList_WHEN_addFirstNode_THEN_isNotEmpty() {
        sut.insertToHead(firstNode)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_GIVEN_linkedList_WHEN_addNodeBeforeFirstNode_THEN_succeed() {
        sut.insertToHead(firstNode)
        let isSucceed = sut.insert(before: firstNode, with: beforeNode)
        XCTAssertTrue(isSucceed)
    }
    
    func test_GIVEN_LinkedList_WHEN_addNodeAfterFirstNode_THEN_succeed() {
        sut.insertToHead(firstNode)
        let isSucceed = sut.insert(after: firstNode, with: afterNode)
        XCTAssertTrue(isSucceed)
    }
    
    func test_GIVEN_linkedListAddSomeNode_WHEN_queryNode_THEN_returnRightResults() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        XCTAssertNil(sut.node(withValue: 0))
        XCTAssertEqual(sut.node(withValue: 1)?.value, firstNode.value)
        XCTAssertEqual(sut.node(withValue: 2)?.value, afterNode.value)
    }
    
    func test_GIVEN_linkedListWithNode_WHEN_deleteNode_THEN_returnRightResults() {
        sut.insertToHead(firstNode)
        XCTAssertFalse(sut.delete(node: beforeNode))
        XCTAssertTrue(sut.delete(node: firstNode))
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_GIVEN_linkedListWithNode_WHEN_queryWithIndex_THEN_returnRightResults() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(before: firstNode, with: beforeNode)
        XCTAssertEqual(sut.node(atIndex: 1), beforeNode)
        XCTAssertEqual(sut.node(atIndex: 2), firstNode)
        XCTAssertEqual(sut.node(atIndex: 3), afterNode)
    }
    
    func test_GIVEN_linkedListWithNode_WHEN_reverseLinkedNode_THEN_returnRightResults() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(before: firstNode, with: beforeNode)
        let reverseHeadNode = sut.reverseNodeList(headNode: beforeNode)
        XCTAssertEqual(reverseHeadNode, afterNode)
    }
    
    func test_GIVEN_linkedListWithCircle_WHEN_detectTheCircle_THEN_returnTrue() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(after: afterNode, with: beforeNode)
        beforeNode.next = firstNode
        let hasCircle = sut.hasCircle(headNode: firstNode)
        XCTAssertTrue(hasCircle)
    }
    
    func test_GIVEN_linkedListWithNode_WHEN_deleteWithIndex_THEN_returnRightResult() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(after: afterNode, with: beforeNode)
        let result = sut.delete(index: 2)
        XCTAssertTrue(result)
        XCTAssertEqual(sut.node(atIndex: 2), beforeNode)
    }
    
    func test_GIVEN_linkedListWithNode_WHEN_deleteWithReverseIndex_THEN_returnRightResult() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(after: afterNode, with: beforeNode)
        let result = sut.deleteFromBottom(reverseIndex: 3)
        XCTAssertTrue(result)
        XCTAssertEqual(sut.node(atIndex: 1), afterNode)
    }
    
    func test_GIVEN_linkedListWithNodes_WHEN_getTheHalfNode_THEN_returnTheRightNode() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(after: afterNode, with: beforeNode)
        let result = sut.halfNode(in: firstNode)
        XCTAssertEqual(result, afterNode)
    }
    
    func test_GIVEN_linkedListWithOneNode_WHEN_deleteTheLastOne_THEN_returnNil() {
        sut.insertToHead(firstNode)
        let result = sut.deleteNthFromEnd(head: firstNode, n: 1)
        XCTAssertNil(result)
    }
    
    func test_GIVEN_linkedListWithTwoNodes_WHEN_deleteTheSecondOne_THEN_returnRightNode() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        let result1 = sut.deleteNthFromEnd(head: firstNode, n: 2)
        XCTAssertEqual(result1, afterNode)
    }

}
