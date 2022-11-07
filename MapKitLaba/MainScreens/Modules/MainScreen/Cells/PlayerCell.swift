//
//  PlayerCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.11.2022.
//

import UIKit
import SnapKit


class PlayerCell: Cell {
    
    var model: String?
    //    {
    //        didSet {
    //            self.textField = BaseTextField(model ?? "")
    //        }
    //    }
    
    private var albumImageView = UIImageView()
    
    private var songTitle = UILabel()
    
    var delegate: SomeProtocol?
    var delegateTwo: PlayerCellProtocol?
    var gesture: UITapGestureRecognizer?
    
    private var flowName = UILabel()
    private var roundedContentView = UIImageView()
    
    var firstIcon = UIImageView()
    var secondIcon = UIImageView()
    var thirdIcon = UIImageView()
    
    var firstLabel = UILabel()
    var secondLabel = UILabel()
    var thirdLabel = UILabel()
    
    
    let a = "-[UITableViewCellContentView handleTap:]: unrecognized selector sent to instance 0x7f9273184540"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self.contentView, action: #selector(printed))
        self.self.contentView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        setup()
    }
    //    handleTap(_:)
    @objc func printed() {
        print("Some")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("handleTap")
        //        self.delegate?.didTapFlow(for: self)
        //        self.delegateTwo?.didTapImageView(for: self)
        
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
        
        
        roundedContentView.image = UIImage(named: "Player")
        //        groupName.text = "Pete Rock & C.L. Smooth"
        flowName.minimumScaleFactor = 1
        flowName.font = .systemFont32Black
        flowName.text = "Player"
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
        }
        
        flowName.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(36)
            $0.top.equalTo(roundedContentView.snp.top).offset(13)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

