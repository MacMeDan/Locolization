//
//  UpdateLocalisedStringKeys.swift
//  Locolize.strings
//
//  Created by Dan Leonard on 3/1/18.
//  Copyright © 2018 AutoSource Motors. All rights reserved.
//
// Generates a Swift source file defining an enum with all possible localised string keys.
import Foundation

let projectDirectory = URL(fileURLWithPath: pathToProject)
var needCustomKey:[String] = []

func locolizeNewString( _ newString: String, newKey: String? = nil) {
    // Removes duplicates from strings file
    var newData: String
    let componets = sourceFilePath.components(separatedBy: "/")
    var allValues = Array(Set(NSDictionary(contentsOf: projectDirectory.appendingPathComponents(componets))!.allValues as! [String]))
    if allValues.contains(newString) { needCustomKey.append(newString) }
    allValues.append(newString)
    allValues = allValues.sorted().flatMap{ $0.camelCased }
    newData = allValues.flatMap{ getEntry(key: newKey, value: $0) }.joined()

    // Chain write data and generate enum to give an updated version of both files with new entry added.
    writeData(newData, path: destinationFilePath.components(separatedBy: "/")) { _ in
        generateResourceEnum()
    }
}

func writeData( _ newData: String, path: [String], completion:((String) -> Void)) {
    do {
        try newData.write(to: projectDirectory.appendingPathComponents(path), atomically: true, encoding: .utf8)
        completion("Sucsess Writing to path: \(path)")
    } catch {
        completion(error.localizedDescription)
    }
}

func getEntry(key: String? = nil, value rawValue: String) -> String? {
    if let key = key {
        return "\n/** \(rawValue.exscapeNewLine) **/\n\"\(key)\" = \"\(rawValue.exscapeNewLine)\";\n"
    } else {
        return "\n/** \(rawValue.exscapeNewLine) **/\n\"\(rawValue.camelCased)\" = \"\(rawValue.exscapeNewLine)\";\n"
    }
}

