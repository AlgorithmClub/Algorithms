//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Doliant on 2021/8/19.
//

import XCTest

final class LinkedListTest: XCTestCase {
    private var sut = SinglyLinkedList<Int>()
    private let firstNode = SinglyNode(1)
    private let beforeNode = SinglyNode(0)
    private let afterNode = SinglyNode(2)
    
    func test_Given_emptyLinkedList_Then_isEmpty() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_Given_emptyLinkedList_When_addFirstNode_Then_isNotEmpty() {
        sut.insertToHead(firstNode)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_Given_LinkedList_When_addNodeBeforeFirstNode_Then_succeed() {
        sut.insertToHead(firstNode)
        let isSucceed = sut.insert(before: firstNode, with: beforeNode)
        XCTAssertTrue(isSucceed)
    }
    
    func test_Given_LinkedList_When_addNodeAfterFirstNode_Then_succeed() {
        sut.insertToHead(firstNode)
        let isSucceed = sut.insert(after: firstNode, with: afterNode)
        XCTAssertTrue(isSucceed)
    }
    
    func test_Given_LinkedListAddSomeNode_When_queryNode_Then_returnRightResults() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        XCTAssertNil(sut.node(withValue: 0))
        XCTAssertEqual(sut.node(withValue: 1)?.value, firstNode.value)
        XCTAssertEqual(sut.node(withValue: 2)?.value, afterNode.value)
    }
    
    func test_Given_LinkedListWithNode_When_deleteNode_Then_returnRightResults() {
        sut.insertToHead(firstNode)
        XCTAssertFalse(sut.delete(node: beforeNode))
        XCTAssertTrue(sut.delete(node: firstNode))
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_Given_LinkedListWithNode_When_queryWithIndex_Then_returnRightResults() {
        sut.insertToHead(firstNode)
        _ = sut.insert(after: firstNode, with: afterNode)
        _ = sut.insert(before: firstNode, with: beforeNode)
        XCTAssertEqual(sut.node(atIndex: 1), beforeNode)
        XCTAssertEqual(sut.node(atIndex: 2), firstNode)
        XCTAssertEqual(sut.node(atIndex: 3), afterNode)
    }

}
