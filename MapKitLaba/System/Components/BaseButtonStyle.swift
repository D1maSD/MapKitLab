//
//  BaseButtonStyle.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.10.2022.
//

import UIKit


class BaseButtonStyle: Cell {
    
     var button = UIButton()
    
    struct Model {
        var style: ViewStyle<UIButton>
        var title: String
        var didTap: () -> Void
    }
    
    var model: Model? {
        didSet {
            print("if")
            if let model = model {
                config(model)
                setup()
                print("Model")
            } else {
                print("No model")
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func config(_ model: Model) {
        button.setTitle(model.title, for: .normal)
        button = UIButton(style: model.style)
        print("Config")
    }
    
    func setup() {
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.height.equalTo(67)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
