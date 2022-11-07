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
    private var newsText = UILabel()
    private var time = UILabel()
    
    
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
