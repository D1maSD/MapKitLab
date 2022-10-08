//
//  UIFont+Extensions.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//

import UIKit

extension UIFont {
    
    static func avenir20() -> UIFont? {
        let font = UIFont(name: "avenir", size: 20)
        return font
    }
    
    static func avenir26() -> UIFont? {
        let font = UIFont(name: "avenir", size: 26)
        return font
    }

    static var titleFont: UIFont {
        return .systemFont(ofSize: 20, weight: .medium)
    }
    
    static var textFont: UIFont {
        return .systemFont(ofSize: 16, weight: .thin)
    }
    
    static var logoTitleFont: UIFont {
        return .systemFont(ofSize: 40, weight: .black)
    }
    
    static var logoSubtitleFont: UIFont {
        return .systemFont(ofSize: 20, weight: .regular)
    }
    
    static var onboardingTextFont: UIFont {
        return .textFont.withSize(16)
    }

    static var placehodlerFont: UIFont {
        return .logoSubtitleFont.withSize(16)
    }

    static var titleBaseCellFont: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .bold)
    }

    static var subtitleBaseCellFont: UIFont {
        return UIFont(name: "SFCompact-Thin", size: 15) ?? .systemFont(ofSize: 15, weight: .thin)
    }

    static var  subtitleBaseDescriptionFont: UIFont {
        return UIFont(name: "SFCompact-Regular", size: 14) ?? .systemFont(ofSize: 15, weight: .regular)
    }

    
    static var sf32Font: UIFont {
        return .systemFont(ofSize: 40, weight: .bold)
    }
}
