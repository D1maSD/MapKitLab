//
//  NewsButton.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 13.10.2022.
//

import UIKit


class NewsButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
}
