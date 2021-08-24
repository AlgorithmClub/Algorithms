//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Doliant on 2021/8/19.
//

import XCTest

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

}
