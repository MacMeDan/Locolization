//
//  main.swift
//  Locoliziation
//
//  Created by Dan Leonard on 3/5/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//


import Foundation

//SET PATHS TO YOUR PROJECT FILES
var pathToProject: String = "/Locolization/"
var sourceFilePath: String = "Localiziation/Localizable.strings"
var destinationFilePath: String = "Localiziation/temp.strings"
var resourceFilePath: String = "Localiziation/Resources.swift"


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

func error() -> String {
    print("""
        No `:` found please try again
        """, terminator: "")
    return readLine()!
}

func containsColin(_ string: String) -> Bool {
    return string.contains(":")
}

// MARK: Setup
//print("""
//    Please enter the path to your project.
//    """, terminator: "")
//pathToProject = readLine()!
//
//print("""
//    Please enter the path from your project base directory to your destination file.
//    """, terminator: "")
//sourceFilePath = readLine()!
//
//print("""
//    Please enter the path from your project base directory to your to your Resource file.
//    """, terminator: "")
//resourceFilePath = readLine()!

// MARK: Options
print("""
    Please select an option:
    1) Add new entry with auto gernerated key
    2) Add new entry with specified key
    3) Generate Resources
    4) Generate Strings
    5) Generate Strings Sorted by Value not Key
    6) Find Strings in file

    """, terminator: "")
let answer = readLine()!

if answer == "1" {
    print("""
    Please enter the string you would like to locolize:

    """, terminator: "")
    let newString = readLine()!
    print("using Key: \(newString.camelCased)")
    locolizeNewString(newString)
}

if answer == "2" {
    print("""
    Please enter the Key : Value you would like to add:

    """, terminator: "")
    let newString = readLine()!

    if containsColin(newString){
        let componets = newString.components(separatedBy: ":")
        guard componets.count == 2 else {
            fatalError("Should only be 1 colin in input.")
        }
        let newKey = componets.first
        let newValue = componets.last!
        locolizeNewString(newValue, newKey: newKey)
    }

}

if answer == "3" {
    generateResourceEnum()
}

if answer == "4" {
    generateNewStringsFile()
}

if answer == "5" {
    generateNewStringsSortedByKeyFile()
}

if answer == "6" {
    print("""
    What is the full path to the file you would like to convert

    """, terminator: "")
    let filePath = readLine()!
    findUnlocalisedStringsAndConvertThem(fromFilePath: filePath)
}
