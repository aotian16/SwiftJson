//
//  SwiftJsonTests.swift
//  SwiftJsonTests
//
//  Created by 童进 on 15/11/5.
//  Copyright © 2015年 qefee. All rights reserved.
//

import XCTest
@testable import SwiftJson

class SwiftJsonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testParseInt() {
        let str = "111"
        let json = JsonParser.p(str)
        let value: Int? = 111
        
        XCTAssertEqual(json.int, value)
        XCTAssertEqual(json.intValue, value!)
        
        let str1 = "abc"
        let json1 = JsonParser.p(str1)
        let value1: Int? = nil
        
        XCTAssertEqual(json1.int, value1)
        XCTAssertEqual(json1.intValue, -1)
    }
    
    func testParseFloat() {
        let str = "111.234"
        let json = JsonParser.p(str)
        let value: Float? = 111.234
        
        XCTAssertEqual(json.float, value)
        XCTAssertEqual(json.floatValue, value!)
        
        let str1 = "abc"
        let json1 = JsonParser.p(str1)
        let value1: Float? = nil
        
        XCTAssertEqual(json1.float, value1)
        XCTAssertEqual(json1.floatValue, -1)
    }
    
    func testParseDouble() {
        let str = "111.234"
        let json = JsonParser.p(str)
        let value: Double? = 111.234
        
        XCTAssertEqual(json.double, value)
        XCTAssertEqual(json.doubleValue, value!)
        
        let str1 = "abc"
        let json1 = JsonParser.p(str1)
        let value1: Double? = nil
        
        XCTAssertEqual(json1.double, value1)
        XCTAssertEqual(json1.doubleValue, -1)
    }
    
    func testParseString() {
        let str = "\"abc\""
        let json = JsonParser.p(str)
        let value: String? = "abc"
        
        XCTAssertEqual(json.string, value)
        XCTAssertEqual(json.stringValue, value!)
        
        let str1 = "123"
        let json1 = JsonParser.p(str1)
        let value1: String? = nil
        
        XCTAssertEqual(json1.string, value1)
        XCTAssertEqual(json1.stringValue, "")
    }
    
    func testParseBool() {
        let str = "true"
        let json = JsonParser.p(str)
        let value: Bool? = true
        
        XCTAssertEqual(json.bool, value)
        XCTAssertEqual(json.boolValue, value!)
        
        let str1 = "false"
        let json1 = JsonParser.p(str1)
        let value1: Bool? = false
        
        XCTAssertEqual(json1.bool, value1)
        XCTAssertEqual(json1.boolValue, value1!)
        
        let str2 = "\"an not empty string means true\""
        let json2 = JsonParser.p(str2)
        let value2: Bool? = true
        
        XCTAssertEqual(json2.bool, value2)
        XCTAssertEqual(json2.boolValue, value2!)
        
        let str3 = "\"\""
        let json3 = JsonParser.p(str3)
        let value3: Bool? = false
        
        XCTAssertEqual(json3.bool, value3)
        XCTAssertEqual(json3.boolValue, value3!)
        
        let str4 = "1"
        let json4 = JsonParser.p(str4)
        let value4: Bool? = true
        
        XCTAssertEqual(json4.bool, value4)
        XCTAssertEqual(json4.boolValue, value4!)
        
        let str5 = "0"
        let json5 = JsonParser.p(str5)
        let value5: Bool? = false
        
        XCTAssertEqual(json5.bool, value5)
        XCTAssertEqual(json5.boolValue, value5!)
        
        let str6 = true
        let json6 = Json(value: str6)
        let value6: Bool? = true
        
        XCTAssertEqual(json6.bool, value6)
        XCTAssertEqual(json6.boolValue, value6!)
        
        let str7 = false
        let json7 = Json(value: str7)
        let value7: Bool? = false
        
        XCTAssertEqual(json7.bool, value7)
        XCTAssertEqual(json7.boolValue, value7!)
        
        let str8 = "[1,2,3]"
        let json8 = JsonParser.p(str8)
        let value8: Bool? = nil
        
        XCTAssertEqual(json8.bool, value8)
    }
    
    func testParseArray() {
        let str = "[1,\"hello\",{\"this is a key\":\"this is a value\"}]"
        let json = JsonParser.p(str)
        let arrValue1: Int? = 1
        let arrValue2: String? = "hello"
        let arrValue3_key: String? = "this is a key"
        let arrValue3_value: String? = "this is a value"

        XCTAssertEqual(json.arrayValue.count, 3)
        XCTAssertEqual(json[0].int, arrValue1)
        XCTAssertEqual(json[0].intValue, arrValue1!)
        XCTAssertEqual(json[1].string, arrValue2)
        XCTAssertEqual(json[1].stringValue, arrValue2!)
        XCTAssertEqual(json[2][arrValue3_key!].string, arrValue3_value)
        XCTAssertEqual(json[2][arrValue3_key!].stringValue, arrValue3_value!)
        XCTAssert(!json[2].isNull())
        XCTAssert(json[3].isNull())
    }
    
    func testParseDictionary() {
        let str = "{\"key\": [1,\"hello\",{\"this is a key\":\"this is a value\"}]}"
        let json = JsonParser.p(str)
        let key1 = "key"
        let key2 = "this is a key"
        let value: String? = "this is a value"

        XCTAssertEqual(json.dictionaryValue.count, 1)
        XCTAssertEqual(json[key1][2][key2].string, value)
        XCTAssertEqual(json[key1][2][key2].stringValue, value!)
    }
    
    func testParseError() {
        let str = "abc"
        let json = JsonParser.p(str)
        
        XCTAssert(json.isNull())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
