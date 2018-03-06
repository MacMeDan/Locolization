//
//  main.swift
//  Locoliziation
//
//  Created by Dan Leonard on 3/5/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//


import Foundation

var pathToProject: String
var sourceFilePath: String
var destinationFilePath: String = "Localiziation/temp.strings"
var resourceFilePath: String

func getValue() {
    let value = needCustomKey[0]
    print("""
        Please enter unique key for entry:
        \(value)

        """, terminator: "")
    let newKey = readLine()!
    locolizeNewString(value, newKey: newKey)
    needCustomKey.removeFirst()
    getValue()
}

// MARK: Setup
print("""
    Please enter the path to your project.
    """, terminator: "")
pathToProject = readLine()!

print("""
    Please enter the path from your project base directory to your destination file.
    """, terminator: "")
sourceFilePath = readLine()!

print("""
    Please enter the path from your project base directory to your to your Resource file.
    """, terminator: "")
resourceFilePath = readLine()!

// MARK: Options
print("""
    Please select an option:
    1) Preview generated key
    2) Generate Resources Enum
    3) Add entry to Locolized

    """, terminator: "")
let answer = readLine()!

if answer == "1" {
    print("""
    Please enter the string you would like to locolize:

    """, terminator: "")
    let newString = readLine()!
    print(newString.camelCased)
}

if answer == "2" {
    generateResourcesEnum()
}

if answer == "3" {
    print("""
    Please enter the string you would like to locolize:

    """, terminator: "")
    let newString = readLine()!
    locolizeNewString(newString)
}

if needCustomKey.count > 0 {
    getValue()
}

