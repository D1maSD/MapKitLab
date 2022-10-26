//
//  SheduleCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


class SheduleCell: Cell {
    
    var model: String?
//    {
//        didSet {
//            self.textField = BaseTextField(model ?? "")
//        }
//    }
    
    private var albumImageView = RoundView()
    
//    {
//        didSet {
//            setup()
//        }
//    }
    
    private var usernameLabel = UILabel()
    
//    private var newsText = UILabel()
    
    private var newsText = UILabel()
    private var noteLabel = UILabel()
    private var bottomLine = UIView()
    private var moreButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        
        
        usernameLabel.font = .systemFont20Bold
        
//        newsText.backgroundColor = .clear
//        newsText.textAlignment = .left
//        newsText.numberOfLines = 5
//        newsText.minimumScaleFactor = 0.8
//        newsText.adjustsFontSizeToFitWidth = true
//        newsText.font = .titleBaseCellFont

        noteLabel.text = "Here a some task description"
        noteLabel.minimumScaleFactor = 0.6
        noteLabel.font = .subtitleBaseDescriptionFont
        
        bottomLine.backgroundColor = .systemGray
//        albumImageView.layer.cornerRadius = 2
        
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        contentView.addSubview(albumImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(noteLabel)
        contentView.addSubview(bottomLine)
        contentView.addSubview(moreButton)
        
        usernameLabel.text = "Adam Smith"
        
        albumImageView.backgroundColor = .red
        
        albumImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().offset(-11)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        bottomLine.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.left).offset(15)
            $0.top.equalTo(albumImageView.snp.bottom).offset(11)
            $0.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(albumImageView.snp.top)
        }
        
        noteLabel.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(6)
        }
        
//        moreButton.snp.makeConstraints {
//            $0.right.equalTo(contentView.snp.right).offset(-15)
////            $0.top.equalTo(songTitle.snp.bottom).offset(6)
//            $0.height.equalTo(24)
//            $0.width.equalTo(8)
//            $0.centerX.equalTo(albumImageView.snp.centerX)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
