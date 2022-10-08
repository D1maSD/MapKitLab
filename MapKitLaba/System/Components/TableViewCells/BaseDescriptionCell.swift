//
//  BaseDescriptionCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.10.2022.
//

import UIKit


class BaseDescriptionCell: Cell {
    
    struct Model {
        var style: ViewStyle<UILabel>
        var text: String
        var bottomOffset: CGFloat?
        var topOffset: CGFloat?
    }
        
    var descLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .left
    }))
    
    var model: Model?
    
//    {
//            didSet {
//                if let model = model {
//                    descLabel = UILabel(style: model.style)
//                    descLabel.text = model.text
//                    setup(bottomOffset: model.bottomOffset ?? -15, topOffset: model.topOffset ?? 15)
//
//                }
//            }
//        }
    
//    private var descLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup(bottomOffset: -15, topOffset: 15)
    }
    
    
    private func setup(bottomOffset: CGFloat, topOffset: CGFloat) {
        
        contentView.addSubview(descLabel)
        
        descLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.top.equalToSuperview().offset(topOffset)
            $0.bottom.equalToSuperview().offset(bottomOffset)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
