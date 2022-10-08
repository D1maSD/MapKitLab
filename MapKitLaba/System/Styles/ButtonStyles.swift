//
//  ButtonStyles.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.09.2022.
//

import UIKit


extension ViewStyle where T == UIButton {
    
    static let baseStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .clear
    }
    
    static let baseStyleTwo = ViewStyle<UILabel> {
        $0.backgroundColor = .clear
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.minimumScaleFactor = 0.5
        $0.adjustsFontSizeToFitWidth = true
    }
    
    static let blueSaveRoundedStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(named: "save"), for: .normal)
    }
    
    static let blueLikeRoundedStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(named: "like"), for: .normal)
    }
    
    static let blueTipRoundedStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(named: "tip"), for: .normal)
    }
    
    static let darkRoundedButtonStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .darkRoundedButtonColor
    }
    
    static let clearRoundedButtonStyle = ViewStyle<UIButton> {
        $0.backgroundColor = .clear
    }
    
    
    
    static let sighUpButtonStyle = Self.darkRoundedButtonStyle + ViewStyle<UIButton> {
//        $0.setImage(.signUp, for: .normal)
        $0.titleLabel?.font = .sf32Font.withSize(24)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    static let sighInClearButtonStyle = Self.clearRoundedButtonStyle + ViewStyle<UIButton> {
//        $0.setImage(.signUp, for: .normal)
        $0.titleLabel?.font = .sf32Font.withSize(24)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
    }
}
