//
//  RoundView.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 10.10.2022.
//

import UIKit


class RoundView: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = .maximum(frame.width, frame.height) / 2.0
    }
}
