//
//  Resources.swift
//  InspectionTool
//
//  Created by Dan Leonard on 3/1/18.
//
//  This file is autogenerated by UpdateLocalisedStringKeys.swift
//
// `r` represents Resource a common practace used in other development enviroments.


protocol Localizable {
    var tableName: String { get }
    var localized: String { get }
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
    // This is to call attention to strings that are not locolised for debugging.
        return NSLocalizedString(self, tableName: tableName, value: "‼️ \(self) ‼️", comment: "Add to Localizable.strings file")
    }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return rawValue.localized(tableName: tableName)
    }
}

public enum r: String, Localizable {
    case allAreas
    case componentHasBeenAcceptablyRepaired
    case componentIsUnacceptable

    var tableName: String {
//TODO: update this to "Localizable" once we are ready to replace the original.
        return "Localizable"
    }
}