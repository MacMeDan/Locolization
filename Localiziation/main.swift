//
//  main.swift
//  Locoliziation
//
//  Created by Dan Leonard on 3/5/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//


import Foundation

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

print("""
    Please select an option:
    1) Preview generated key
    2) Generate Resources Enum
    3) Add entry to Locolized
    4) write Old

    """, terminator: "")
let answer = readLine()!

if answer == "1" {
    print("""
    Please enter the string you would like to locolize:

    """, terminator: "")
    let newString = readLine()!
    getCustomKeyForString(newString)
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

if answer == "4" {
    writeOld()
}


if needCustomKey.count > 0 {
    getValue()
}

