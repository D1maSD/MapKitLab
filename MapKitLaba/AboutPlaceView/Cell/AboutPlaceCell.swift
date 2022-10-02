//
//  LocationImageCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import MapKit
import UIKit
import SnapKit

class AboutPlaceCell: UITableViewCell {
    
    private var placeImage = UIImageView()
    var pageControllView = UIView()
    
    var shortNameLabel = UILabel()
    var fullNameLabel = UILabel()
    
    var rateRoundButton = RoundButton(frame: .zero)
    
    private lazy var saveButton = RoundButton(frame: .zero)
    private lazy var rateButton = RoundButton(frame: .zero)
    private lazy var writeTipButton = RoundButton(frame: .zero)
    
    var saveLabel = UILabel()
    var rateLabel = UILabel()
    var writeLabel = UILabel()
    
    var separatorView = UIView()
    var separatorViewTwo = UIView()
    var separatorViewThree = UIView()
    
    var userAnswearLabel = UILabel()
    
    var userButton = RoundButton(frame: .zero)
    
    var informationLabel = UILabel()
    
    var openLabel = UILabel()
    var timeIcon = UIImageView()
    
    var phoneLabel = UILabel()
    var phoneIcon = UIImageView()
    
    var webSiteLabel = UILabel()
    var webIcon = UIImageView()
    
    var miniMapView = MKMapView()
    var adressLabel = UILabel()
    var adressIcon = UIImageView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
        setupUI()
        
        saveButton.backgroundColor = .systemBlue
        saveButton.setImage(UIImage(named: "time"), for: .normal)
        
        rateRoundButton.backgroundColor = .systemOrange
        rateRoundButton.setImage(UIImage(named: "4.9"), for: .normal)
        
        rateButton.backgroundColor = .systemBlue
        rateButton.setImage(UIImage(named: "time"), for: .normal)
        
        writeTipButton.backgroundColor = .systemBlue
        writeTipButton.setImage(UIImage(named: "time"), for: .normal)
        
        
        
        userButton.backgroundColor = .systemRed
        
        timeIcon.image = UIImage(named: "time")
        phoneIcon.image = UIImage(named: "phone")
        webIcon.image = UIImage(named: "web")
        adressIcon.image = UIImage(named: "pin")
    }
    
    func setupUI() {
        separatorView.backgroundColor = .red
        separatorViewTwo.backgroundColor = .orange
        separatorViewThree.backgroundColor = .yellow
        placeImage.backgroundColor = .systemBrown
        
        
        shortNameLabel.text = "ЦУМ"
        fullNameLabel.text = "Универмаг в Севастополь"
        
        saveLabel.text = "Сохранить"
        rateLabel.text = "Оценить"
        writeLabel.text = "Написать отзыв"
        userAnswearLabel.text = "Вы были в этом месте"
        
        openLabel.text = "Вероятно открыто"
        phoneLabel.text = "Добавить телефон"
        webSiteLabel.text = "Добавить веб-сайт"
        
        adressLabel.text = "ул. Вакуленчука"
        informationLabel.text = "Информация"
    }
    
    func setUpLayout() {
        
        
        
        self.contentView.backgroundColor = .white
        
        contentView.addSubviewWith(placeImage)
        
        if #available(iOS 11.0, *) {
            
            let guide = self.contentView.safeAreaLayoutGuide
            placeImage.snp.makeConstraints {
                $0.trailing.equalTo(guide.snp.trailing)
                $0.leading.equalTo(guide.snp.leading)
                $0.top.equalTo(guide.snp.top).offset(-50)
                $0.height.equalTo(250)
            }
            
        } else {
            NSLayoutConstraint(item: placeImage,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .top,
                               multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: placeImage,
                               attribute: .leading,
                               relatedBy: .equal, toItem: contentView,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0).isActive = true
            NSLayoutConstraint(item: placeImage, attribute: .trailing,
                               relatedBy: .equal,
                               toItem: contentView,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0).isActive = true
        }
        
        
        
        
        contentView.addSubviewWith(pageControllView)
        contentView.addSubviewWith(shortNameLabel)
        contentView.addSubviewWith(fullNameLabel)
        contentView.addSubviewWith(rateRoundButton)
        
        contentView.addSubviewWith(saveButton)
        contentView.addSubviewWith(rateButton)
        contentView.addSubviewWith(writeTipButton)
        
        contentView.addSubviewWith(saveLabel)
        contentView.addSubviewWith(rateLabel)
        contentView.addSubviewWith(writeLabel)
        contentView.addSubviewWith(separatorView)
        contentView.addSubviewWith(separatorViewTwo)
        contentView.addSubviewWith(separatorViewThree)
        contentView.addSubviewWith(userAnswearLabel)
        contentView.addSubviewWith(userButton)
        contentView.addSubviewWith(informationLabel)
        contentView.addSubviewWith(openLabel)
        contentView.addSubviewWith(timeIcon)
        contentView.addSubviewWith(phoneLabel)
        contentView.addSubviewWith(phoneIcon)
        contentView.addSubviewWith(webSiteLabel)
        contentView.addSubviewWith(webIcon)
        contentView.addSubviewWith(miniMapView)
        contentView.addSubviewWith(adressLabel)
        contentView.addSubviewWith(adressIcon)
        
//        placeImage.snp.makeConstraints {
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.top.equalToSuperview()
//            //250
//            $0.height.equalTo(250)
//        }
        shortNameLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.top.equalTo(placeImage.snp.bottom).offset(10)
        }
        fullNameLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.top.equalTo(shortNameLabel.snp.bottom).offset(10)
        }
        rateRoundButton.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).offset(-20)
            $0.top.equalTo(placeImage.snp.bottom).offset(10)
            $0.height.width.equalTo(64)
        }
        separatorView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(20)
            $0.height.equalTo(17)
        }
        saveButton.snp.makeConstraints {
            $0.left.equalTo(self.contentView.snp.left).offset(40)
            $0.top.equalTo(separatorView.snp.bottom).offset(15)
            $0.height.width.equalTo(50)
        }
        rateButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.centerX.equalTo(self.contentView.snp.centerX)
            $0.height.width.equalTo(50)
        }
        writeTipButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.right.equalTo(self.contentView.snp.right).offset(-40)
            $0.height.width.equalTo(50)
        }
        
        saveLabel.snp.makeConstraints {
            $0.centerX.equalTo(saveButton.snp.centerX)
            $0.top.equalTo(saveButton.snp.bottom).offset(6)
        }
        rateLabel.snp.makeConstraints {
            $0.centerX.equalTo(rateButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        writeLabel.snp.makeConstraints {
            $0.centerX.equalTo(writeTipButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        
        separatorViewTwo.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(writeLabel.snp.bottom).offset(14)
            $0.height.equalTo(17)
        }
        userAnswearLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.right.equalToSuperview()
            $0.top.equalTo(separatorViewTwo.snp.bottom).offset(7)
        }

        userButton.snp.makeConstraints {
            $0.left.equalTo(userAnswearLabel.snp.left)
            $0.top.equalTo(userAnswearLabel.snp.bottom).offset(7)
            $0.height.width.equalTo(25)
        }

        separatorViewThree.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(userButton.snp.bottom).offset(7)
            $0.height.equalTo(17)
        }
        informationLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(separatorViewThree.snp.bottom).offset(10)
        }
        timeIcon.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        openLabel.snp.makeConstraints {
            $0.left.equalTo(timeIcon.snp.right).offset(20)
            $0.centerY.equalTo(timeIcon.snp.centerY)
        }
        phoneIcon.snp.makeConstraints {
            $0.top.equalTo(timeIcon.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        phoneLabel.snp.makeConstraints {
            $0.left.equalTo(phoneIcon.snp.right).offset(20)
            $0.centerY.equalTo(phoneIcon.snp.centerY)
        }
        webIcon.snp.makeConstraints {
            $0.top.equalTo(phoneIcon.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        webSiteLabel.snp.makeConstraints {
            $0.left.equalTo(webIcon.snp.right).offset(20)
            $0.centerY.equalTo(webIcon.snp.centerY)
        }
        miniMapView.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right)
            $0.left.equalTo(contentView.snp.left)
            $0.top.equalTo(webSiteLabel.snp.bottom).offset(10)
            $0.height.width.equalTo(100)
        }
        adressIcon.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(miniMapView.snp.bottom).offset(10)
            $0.height.width.equalTo(25)
        }
        adressLabel.snp.makeConstraints {
            $0.left.equalTo(adressIcon.snp.right).offset(20)
            $0.centerY.equalTo(adressIcon.snp.centerY)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
