//
//  AgreeWithRulesSwift.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


class AgreeWithRulesSwift: Cell {
    
    struct Model {
        var style: ViewStyle<UILabel>
        var text: String
        var bottomOffset: CGFloat?
        var topOffset: CGFloat?
    }
        
    var descLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .left
    }))
    var agreeWith = UILabel(text: "Agree with rules")
    var switcher = UISwitch()
    
    var model: Model?
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    
    private func setup() {
        
        contentView.addSubview(descLabel)
        contentView.addSubview(switcher)
        
        NSLayoutConstraint.activate([
            agreeWith.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 35),
            agreeWith.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            agreeWith.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
            switcher.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            switcher.heightAnchor.constraint(equalToConstant: 30),
            switcher.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
