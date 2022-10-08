//
//  BaseTextField.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 06.10.2022.
//

import UIKit


class BaseTextField: UITextField {
    
    private var customLeftView: UIView! {
        didSet { setupLeftView() }
    }
    
    private var leftViewWidth: CGFloat { customLeftView.frame.width }
    
    private var customPlaceholder = UILabel(style: .baseTextFieldViewStyle.compose(with: ViewStyle<UILabel> {
        $0.textColor = .systemGray
    }))
    
    private let height = 52
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(_ leftText: String) {
        self.init(frame: .zero)
        setup()
        setupLeftView(with: leftText)
        setupPlaceHolder()
        
    }
    
//    init(_ leftText: String) {
//        super.init(frame: .zero)
//        setup()
//        setupLeftView(with: leftText)
//        setupPlaceHolder()
//        
//    }
//    
    private func setup() {
        self.font = .placehodlerFont
        self.resignFirstResponder()
        self.leftViewMode = .always
        self.layer.cornerRadius = 15
        self.backgroundColor = .defaultGrayTextFieldColor
        self.autocorrectionType = .no
        
    }
    
    private func setupLeftView(with text: String) {
        let center = Int(self.frame.height) / 2
        let view = UIView.with { view in
            view.frame = CGRect(
                x: 10,
                y: center,
                width: text.count * 11,
                height: self.height
            )
            let label = UILabel(style: .baseTextFieldViewStyle)
            label.text = text
            label.frame = view.frame
            view.addSubview(label)
        }
        customLeftView = view
        addSubview(customLeftView)
    }
    
    private func setupPlaceHolder() {
        let text = "Placeholder"
        let center = Int(self.frame.height) / 2
        
        customPlaceholder.frame = CGRect(
            x: Int(customLeftView.frame.maxX) + 10,
            y: center,
            width: text.count * 11,
            height: self.height
        )
        
        customPlaceholder.text = text
        addSubview(customPlaceholder)
    }
    
    private func setupLeftView() {
        self.leftView = customLeftView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
