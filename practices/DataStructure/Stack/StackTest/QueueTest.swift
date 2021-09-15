//
//  QueueTest.swift
//  StackTest
//
//  Created by Doliant on 2021/9/15.
//

import XCTest

class QueueTest: XCTestCase {
    
    var sut: ArrayQueue<Int>!
    
    override func setUp() {
        super.setUp()
        sut = ArrayQueue<Int>()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testQueueOperation() {
        XCTAssertTrue(sut.isEmpty)
        _ = sut.enqueue(newElement: 1)
        _ = sut.enqueue(newElement: 2)
        XCTAssertEqual(1, sut.dequeue())
        XCTAssertEqual(1, sut.size)
        XCTAssertEqual(2, sut.dequeue())
        XCTAssertTrue(sut.isEmpty)
    }
    
}
