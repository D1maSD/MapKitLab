//
//  BaseTextFieldCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.10.2022.
//

import UIKit


class BaseTextFieldCell: Cell {
    
    var model: String? {
        didSet {
            self.textField = BaseTextField(model ?? "")
        }
    }
    
    var textField: BaseTextField! {
        didSet {
            setup()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        setup()
    }
    
    private func setup() {
        contentView.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
