//
//  DataModel.swift
//  SwiftShuati
//
//  Created by Bohao Li on 8/13/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class DataModel: Codable, Equatable {
    static func == (lhs: DataModel, rhs: DataModel) -> Bool {
        return lhs.firstField == rhs.firstField && lhs.secondField == rhs.secondField
    }

    let firstField: String
    let secondField: String

    init(firstField: String, secondField: String) {
        self.firstField = firstField
        self.secondField = secondField
    }
}

class NestedDataModel: DataModel {
    let thirdField: DataModel

    init(firstField: String, secondField: String, thirdField: DataModel) {
        self.thirdField = thirdField
        super.init(firstField: firstField, secondField: secondField)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
