//
//  exampleFileWIthStrings.swift
//  Localiziation
//
//  Created by Dan Leonard on 3/15/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

import Foundation
class TitleImageGalleryViewController {

    let title: String = "Image Gallery"
    let viewModel: NSObject? = nil

    func things() {
        let a: Int = 2
        let b: Int = 8
        
        if a == b {
            assertionFailure()
        }

        if viewModel == nil {
            // Should not be converted to Localizable
            fatalError("call configure first to set Viewmodel")
        }
    }

}
