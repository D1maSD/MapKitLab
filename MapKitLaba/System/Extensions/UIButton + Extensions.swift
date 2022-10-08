//
//  UIButton + Extensions.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//

import UIKit

extension UIButton {
    
     convenience init(title: String,
                         titleColor: UIColor,
                         backgroundColor: UIColor,
                         font: UIFont,
                         shadow: Bool)
    {
        self.init(type: .system)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        
        if shadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            
        }
    }
    
     func addRightIcon(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let length = CGFloat(30)
        titleEdgeInsets.right += length

                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
                    imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
                    imageView.widthAnchor.constraint(equalToConstant: length),
                    imageView.heightAnchor.constraint(equalToConstant: length)
                ])
    }
    
    func setUpBackgroundView(view: UIView) {
        view.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        view.isUserInteractionEnabled = false
        self.addSubview(view)
    }
    
}
