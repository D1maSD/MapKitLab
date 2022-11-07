//
//  MapCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.11.2022.
//

import UIKit
import SnapKit


class MapCell: Cell {
    
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
        print("gesture")
        setup()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("handleTap")
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

        
        roundedContentView.image = UIImage(named: "map")
//        groupName.text = "Pete Rock & C.L. Smooth"
        flowName.minimumScaleFactor = 1
        flowName.font = .systemFont32Black
        flowName.text = "Map"
        flowName.textColor = .white
        flowName.translatesAutoresizingMaskIntoConstraints = false
        
        
        roundedContentView.layer.cornerRadius = 20
        
//        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        contentView.addSubview(roundedContentView)
        roundedContentView.addSubview(flowName)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(thirdLabel)
                                                            
        
        contentView.addSubview(firstIcon)
        contentView.addSubview(secondIcon)
        contentView.addSubview(thirdIcon)
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
//            $0.width.equalTo(self.frame.width)
        }
        
        flowName.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(36)
            $0.top.equalTo(roundedContentView.snp.top).offset(13)
        }
        
//        groupName.snp.makeConstraints {
//            $0.left.equalTo(albumImageView.snp.right).offset(15)
//            $0.top.equalTo(songTitle.snp.bottom).offset(6)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

