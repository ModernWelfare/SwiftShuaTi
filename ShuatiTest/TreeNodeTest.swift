//
//  TreeNodeTest
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class TreeNodeTest: XCTestCase {

    func testDeSerialization() {
        let input = [3,9,20,nil,nil,15,7]
        let root = TreeNode.deserialize(input: input)

        XCTAssert(root?.value == 3)
        XCTAssert(root?.left?.value == 9)
        XCTAssert(root?.right?.value == 20)
        XCTAssert(root?.right?.left?.value == 15)
        XCTAssert(root?.right?.right?.value == 7)
    }
}
