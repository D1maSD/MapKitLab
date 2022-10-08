//
//  LabelStyles.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//

import UIKit

extension ViewStyle where T == UILabel {
    static let baseStyle = ViewStyle<UILabel> {
        $0.backgroundColor = .clear
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.minimumScaleFactor = 0.5
        $0.adjustsFontSizeToFitWidth = true
    }

    static let baseTitleStyle = Self.baseStyle.compose(
        with: ViewStyle<UILabel> {
            $0.font = .titleFont
            $0.textColor = .titleTextColor
        }
    )
    
    static let baseSubtitleStyle = Self.baseStyle.compose(
        with: ViewStyle<UILabel> {
            $0.font = .textFont
            $0.textColor = .subtitleTextColor
        }
    )
    
    static let boldTextLabel = Self.baseStyle.compose(
        with: ViewStyle<UILabel> {
            $0.font = .sf32Font
            $0.textColor = .subtitleTextColor
            $0.textAlignment = .center
        }
    )

    static let baseTextFieldViewStyle = Self.baseTitleStyle.compose(
        with: ViewStyle<UILabel> {
            $0.font = .titleFont.withSize(16)
            $0.textAlignment = .left
        }
    )
    
    
}
