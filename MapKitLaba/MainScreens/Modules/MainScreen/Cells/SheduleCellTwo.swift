//
//  MainScreenCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.11.2022.
//

import UIKit
import SnapKit


class SheduleCellTwo: Cell {
    
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
    
    var delegate: SomeProtocol?
    var gesture: UITapGestureRecognizer?
    
    private var flowName = UILabel()
    private var roundedContentView = UIImageView()
    
    var firstIcon = UIImageView()
    var secondIcon = UIImageView()
    var thirdIcon = UIImageView()
    
    var firstLabel = UILabel()
    var secondLabel = UILabel()
    var thirdLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        albumImageView.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.albumImageView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        setup()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapFlow(for: self)
        
    }

    private func setup() {
        
        
        songTitle.font = .systemFont20Bold
        songTitle.textColor = .white
        
//        newsText.backgroundColor = .clear
//        newsText.textAlignment = .left
//        newsText.numberOfLines = 5
//        newsText.minimumScaleFactor = 0.8
//        newsText.adjustsFontSizeToFitWidth = true
//        newsText.font = .titleBaseCellFont

        
        roundedContentView.image = UIImage(named: "shedule")
        
        flowName.minimumScaleFactor = 1
        flowName.font = .systemFont32Black
        flowName.text = "Shedule"
        flowName.textColor = .white
        flowName.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.font = .systemFont14Regular
        firstLabel.text = "- Call to mama"
        firstLabel.textColor = .white
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabel.font = .systemFont14Regular
        secondLabel.text = "- Check email"
        secondLabel.textColor = UIColor(named: "Color-1")
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstIcon.image = UIImage(named: "firstCheckMark")
        firstIcon.translatesAutoresizingMaskIntoConstraints = false
        
        secondIcon.image = UIImage(named: "secondCheckMark")
        secondIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        roundedContentView.layer.cornerRadius = 20
                
        contentView.addSubview(roundedContentView)
        
        roundedContentView.addSubview(flowName)
        roundedContentView.addSubview(firstIcon)
        roundedContentView.addSubview(secondIcon)
        roundedContentView.addSubview(firstLabel)
        roundedContentView.addSubview(secondLabel)

        print(self.frame.width - 110)
            
        roundedContentView.backgroundColor = .clear
        
        
        // right 40
        // left 40
        // heigt = width - 180
        //
        
        roundedContentView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.equalTo(self.frame.width - 200)
        }
        
        flowName.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(36)
            $0.top.equalTo(roundedContentView.snp.top).offset(13)
        }
        
        firstIcon.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(flowName.snp.bottom).offset(13)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        secondIcon.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(firstIcon.snp.bottom).offset(13)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        
        firstLabel.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(35)
            $0.centerY.equalTo(firstIcon.snp.centerY)
        }
        
        secondLabel.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(35)
            $0.centerY.equalTo(secondIcon.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
