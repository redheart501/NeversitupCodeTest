//
//  NeversitupCodeTestTests.swift
//  NeversitupCodeTestTests
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import XCTest
@testable import NeversitupCodeTest

class NeversitupCodeTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testDateFormat() throws{
        let testISODate = "2022-09-20T16:26:00+00:00"
        XCTAssertEqual(DateFomatterHelper().getDate(timeString: testISODate), "Sep 20, 10:56 PM")
    }
    
    func testGenerateFibo() throws{
        XCTAssertEqual([0, 1, 1, 2, 3, 5, 8, 13], Utility().generateFibonaci(8))
    }
    
    func testGenereatePrime() throws{
        XCTAssertEqual([3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29], Utility().generatePrimeNumber(30))
    }
}
