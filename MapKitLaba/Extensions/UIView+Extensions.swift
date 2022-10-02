//
//  UIView+Extensions.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit


extension UIView {
    
    func addSubviewWith(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
