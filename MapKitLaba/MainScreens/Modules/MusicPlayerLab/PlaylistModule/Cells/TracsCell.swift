//
//  TracsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


class TracsCell: Cell {
    
    var model: String?
//    {
//        didSet {
//            self.textField = BaseTextField(model ?? "")
//        }
//    }
    
    private var albumImageView = UIImageView()
    
//    {
//        didSet {
//            setup()
//        }
//    }
    
    private var songTitle = UILabel()
    
//    private var newsText = UILabel()
    
    weak var delegate: TracsImageCellProtocol? // universal protocol
    var gesture: UITapGestureRecognizer?
    
    private var newsText = UILabel()
    private var groupName = UILabel()
    private var bottomLine = UIView()
    private var moreButton = UIButton()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        albumImageView.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.albumImageView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        setup()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
    }

    private func setup() {
        
        
        songTitle.font = .systemFont20Bold
        
//        newsText.backgroundColor = .clear
//        newsText.textAlignment = .left
//        newsText.numberOfLines = 5
//        newsText.minimumScaleFactor = 0.8
//        newsText.adjustsFontSizeToFitWidth = true
//        newsText.font = .titleBaseCellFont

        groupName.text = "Pete Rock & C.L. Smooth"
        groupName.minimumScaleFactor = 0.6
        groupName.font = .subtitleBaseDescriptionFont
        
        bottomLine.backgroundColor = .systemGray
        albumImageView.layer.cornerRadius = 4
        
//        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        contentView.addSubview(albumImageView)
        contentView.addSubview(songTitle)
        contentView.addSubview(groupName)
        contentView.addSubview(moreButton)
        
        songTitle.text = "It's on You"
        
        albumImageView.backgroundColor = .red
        
        albumImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        
        
        
        songTitle.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(albumImageView.snp.top)
        }
        
        groupName.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(songTitle.snp.bottom).offset(6)
        }
        
//        bottomLine.snp.makeConstraints {
//            $0.left.equalTo(albumImageView.snp.right).offset(15)
//            $0.top.equalTo(albumImageView.snp.bottom).offset(1)
//            $0.right.equalToSuperview()
//            $0.height.equalTo(1)
//        }
        
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


