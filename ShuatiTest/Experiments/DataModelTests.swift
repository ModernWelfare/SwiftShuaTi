//
//  DataModelTests.swift
//  ShuatiTest
//
//  Created by Bohao Li on 8/13/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import XCTest

class DataModelTests: XCTestCase {

    func testDataModel() {
        let dataModel = NestedDataModel(firstField: "1", secondField: "2", thirdField: DataModel(firstField: "3", secondField: "4"))
        let anotherDataModel = NestedDataModel(firstField: "1", secondField: "2", thirdField: DataModel(firstField: "3", secondField: "4"))
        let thirdDataModel = NestedDataModel(firstField: "1", secondField: "3", thirdField: DataModel(firstField: "3", secondField: "4"))
        let fourthDataModel = NestedDataModel(firstField: "1", secondField: "2", thirdField: DataModel(firstField: "4", secondField: "4"))

        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(dataModel)
            let anotherEncode = try encoder.encode(anotherDataModel)
            let thirdEncode = try encoder.encode(thirdDataModel)
            let fourthEncode = try encoder.encode(fourthDataModel)

            XCTAssert(encoded == anotherEncode)
            XCTAssert(encoded == anotherEncode)
            XCTAssert(encoded != thirdEncode)

            // This is the problem, as the encoder doesn't check for nested classes.
            XCTAssert(encoded == fourthEncode)
        } catch {
            XCTFail()
        }
    }

    func testDict() {
        let dict1 = ["1": "2"]
        let dict2 = ["1": "2"]

        let dict3: [Int: DataModel] = [1: DataModel(firstField: "1", secondField: "2")]
        let dict4: [Int: DataModel] = [1: DataModel(firstField: "1", secondField: "2")]

        XCTAssert(dict1 == dict2)
        XCTAssert(dict3 == dict4)
    }
}
