//
//  NewsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


class NewsCell: Cell {
    
    var model: String?
//    {
//        didSet {
//            self.textField = BaseTextField(model ?? "")
//        }
//    }
    
    private var newsImageView = UIImageView()
    
//    {
//        didSet {
//            setup()
//        }
//    }
    
    private var newsTitle = UILabel()
    
//    private var newsText = UILabel()
    
    private var newsText = UILabel()
    private var time = UILabel()
    
//    {
//        $0.backgroundColor = .clear
//        $0.textAlignment = .left
//        $0.numberOfLines = 0
//        $0.minimumScaleFactor = 0.5
//        $0.adjustsFontSizeToFitWidth = true
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        newsTitle.font = .systemFont20Bold
        
        newsText.backgroundColor = .clear
        newsText.textAlignment = .left
        newsText.numberOfLines = 5
        newsText.minimumScaleFactor = 0.8
        newsText.adjustsFontSizeToFitWidth = true
        newsText.font = .systemFont20Bold
        
        time.text = "20m ago"
        time.minimumScaleFactor = 0.6
        time.font = .subtitleBaseDescriptionFont
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsTitle)
        contentView.addSubview(newsText)
        contentView.addSubview(time)

        newsTitle.text = "News title"
        newsText.text = "$0.right.equalToSuperview().offset(-20)$0.top.equalToSuperview().offset(10)"
        newsImageView.backgroundColor = .red
        
        newsImageView.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(130)
            $0.width.equalTo(130)
        }
        
        newsTitle.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        newsText.snp.makeConstraints {
            $0.right.equalTo(newsImageView.snp.left).offset(-20)
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(newsTitle.snp.bottom).offset(5)
        }
        
        time.snp.makeConstraints {
//            $0.right.equalTo(newsImageView.snp.left).offset(-20)
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






////
////  TracsCell.swift
////  MapKitLaba
////
////  Created by Мельник Дмитрий on 08.10.2022.
////
//
//import UIKit
//import SnapKit
//
//
//class TracsCell: Cell {
//    
//    var model: String?
////    {
////        didSet {
////            self.textField = BaseTextField(model ?? "")
////        }
////    }
//    
//    private var albumImageView = UIImageView()
//    
////    {
////        didSet {
////            setup()
////        }
////    }
//    
//    private var songTitle = UILabel()
//    
////    private var newsText = UILabel()
//    
//    private var newsText = UILabel()
//    private var groupName = UILabel()
//    private var bottomLine = UIView()
//    private var moreButton = UIButton()
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setup()
//    }
//
//    private func setup() {
//        
//        
//        songTitle.font = .titleBaseCellFont
//        
////        newsText.backgroundColor = .clear
////        newsText.textAlignment = .left
////        newsText.numberOfLines = 5
////        newsText.minimumScaleFactor = 0.8
////        newsText.adjustsFontSizeToFitWidth = true
////        newsText.font = .titleBaseCellFont
//
//        groupName.text = "Pete Rock & C.L. Smooth"
//        groupName.minimumScaleFactor = 0.6
//        groupName.font = .subtitleBaseDescriptionFont
//        
//        bottomLine.backgroundColor = .systemGray
//        albumImageView.layer.cornerRadius = 2
//        
////        moreButton.setImage(UIImage(named: "more"), for: .normal)
//        
//        contentView.addSubview(albumImageView)
//        contentView.addSubview(songTitle)
//        contentView.addSubview(groupName)
//        contentView.addSubview(moreButton)
//        
//        songTitle.text = "It's on You"
//        
//        albumImageView.backgroundColor = .red
//        
//        albumImageView.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(25)
//            $0.top.equalToSuperview().offset(12)
//            $0.bottom.equalToSuperview().offset(-12)
//            $0.height.equalTo(50)
//            $0.width.equalTo(50)
//        }
//        
//        
//        
//        
//        songTitle.snp.makeConstraints {
//            $0.left.equalTo(albumImageView.snp.right).offset(15)
//            $0.top.equalTo(albumImageView.snp.top)
//        }
//        
//        groupName.snp.makeConstraints {
//            $0.left.equalTo(albumImageView.snp.right).offset(15)
//            $0.top.equalTo(songTitle.snp.bottom).offset(6)
//        }
//        
//        bottomLine.snp.makeConstraints {
//            $0.left.equalTo(albumImageView.snp.right).offset(15)
//            $0.top.equalTo(albumImageView.snp.bottom).offset(1)
//            $0.right.equalToSuperview()
//            $0.height.equalTo(1)
//        }
//        
////        moreButton.snp.makeConstraints {
////            $0.right.equalTo(contentView.snp.right).offset(-15)
//////            $0.top.equalTo(songTitle.snp.bottom).offset(6)
////            $0.height.equalTo(24)
////            $0.width.equalTo(8)
////            $0.centerX.equalTo(albumImageView.snp.centerX)
////        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
