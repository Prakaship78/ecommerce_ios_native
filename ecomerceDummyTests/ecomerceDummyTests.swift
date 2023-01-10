//
//  ecomerceDummyTests.swift
//  ecomerceDummyTests
//
//  Created by Prakash on 05/01/23.
//

import XCTest
@testable import ecomerceDummy

final class ecomerceDummyTests: XCTestCase {
    
    var simpleMath : SimpleMath!
    
    // called before every test
    override func setUp() {
        simpleMath = SimpleMath()
    }
    
    //called after every test
    override func tearDown() {
        simpleMath = nil
    }

    //Test cases
    func testAddTenWorks(){
        //Given - Arrange
        var expected : Int = 0
        // When - Act
        expected = simpleMath.addTen(number: 10)
        //Then - Assert
//        XCTAssert(expected == 20, "error message to show wehn test failed")
//        XCTAssertTrue(expected==20)
        XCTAssertEqual(expected, 20, "error message when failed")
    }
    
    func testSquare(){
        var expected : Int = 0
        
        expected = simpleMath.square(10)
        
        XCTAssertEqual(expected, 100)
    }

}
