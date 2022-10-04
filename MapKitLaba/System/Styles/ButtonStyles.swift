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
}
