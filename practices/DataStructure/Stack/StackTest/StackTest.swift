//
//  StackTest.swift
//  StackTest
//
//  Created by Doliant on 2021/9/14.
//

import XCTest

class StackTest: XCTestCase {
    
    var sut: StackWithArray!

    override func setUp() {
        sut = StackWithArray()
    }

    override func tearDown() {
       sut = nil
    }
    
    func test_GIVEN_emptyStack_THEN_shouldIsEmptyEqualToTure() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_GIVEN_emptyStack_WHEN_addElement_THEN_shouldPushSucceed() {
        let result = sut.push(newElement: 2)
        XCTAssertTrue(result)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.peek, 2)
        XCTAssertEqual(sut.size, 1)
    }
    
    func test_GIVEN_emptyStack_WHEN_addMutipleElements_THEN_shouldHaveRightReturn() {
        _ = sut.push(newElement: 2)
        _ = sut.push(newElement: 3)
        _ = sut.push(newElement: 6)
        XCTAssertEqual(sut.peek, 6)
        XCTAssertEqual(sut.size, 3)
    }
    
    func test_GIVEN_StackWithMutipleElements_WHEN_popElement_THEN_shouldHaveRightReturn() {
        _ = sut.push(newElement: 2)
        _ = sut.push(newElement: 3)
        _ = sut.push(newElement: 6)
        let firstPop = sut.pop()
        XCTAssertEqual(firstPop, 6)
        XCTAssertEqual(sut.peek, 3)
        let secondPop = sut.pop()
        XCTAssertEqual(secondPop, 3)
        XCTAssertEqual(sut.peek, 2)
        let lastPop = sut.pop()
        XCTAssertEqual(lastPop, 2)
        XCTAssertNil(sut.peek)
    }

}
