//
//  main.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

let panagram = Panagram()
let typeahead = Typeahead()

if CommandLine.argc < 2 {
    typeahead.interactiveMode()
} else {
    panagram.staticMode()
}
