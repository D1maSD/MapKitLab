//
//  NoteCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//

import UIKit
import SnapKit


class NoteCell: Cell {
    
    var model: String?
//    {
//        didSet {
//            self.textField = BaseTextField(model ?? "")
//        }
//    }
    
    
    private var roundedContentView = UIView()
    
    var lessonName = UILabel()
    
    var firstTask = UILabel()
    private var secondTask = UILabel()
    
    private var personProfileImage = RoundView()
    private var secondTaskMark = RoundView()
    
    private var verticalLineView = UIView()
    private var roundedCheckMarkView = RoundView()
    private var roundedView = RoundView()
    
    private var markAsDoneButton = UIButton()
    private var deleteButton = UIButton()
    private var doneButtonCount = 1
    
    var gesture: UITapGestureRecognizer?
    weak var delegate: TracsImageCellProtocol?
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        albumImageView.isUserInteractionEnabled = true
//        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        self.albumImageView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
//        setup()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        roundedContentView.isUserInteractionEnabled = true
//        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        self.roundedContentView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        setup()
        markAsDoneButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
    }

    
    @objc func buttonDidTapped() {
        
        doneButtonCount += 1
        if doneButtonCount % 2 == 0 {
            let button = markAsDoneButton
            deleteButton.setImage(UIImage(named: "delete-row"), for: .normal)
            lessonName.textColor = .black
            button.backgroundColor = .systemYellow
            roundedContentView.backgroundColor = .white
            roundedCheckMarkView.backgroundColor = .white
            button.setTitle("Mark as done", for: .normal)
            
            
        } else {
            let button = markAsDoneButton
            deleteButton.setImage(UIImage(named: "delete-row-white"), for: .normal)
            lessonName.textColor = .white
            button.backgroundColor = .white
//            button.setImage(UIImage(named: "done-white"), for: .normal)
            button.setTitle("Marked as done", for: .normal)
            roundedContentView.backgroundColor = .systemYellow
            roundedCheckMarkView.backgroundColor = .systemYellow
            
        }
        
        
        
    }
    private func setup() {
        
        
        firstTask.backgroundColor = .clear
        firstTask.textAlignment = .left
        firstTask.numberOfLines = 2
//        firstTask.minimumScaleFactor = 0.8
//                newsText.adjustsFontSizeToFitWidth = true
//                newsText.font = .titleBaseCellFont

        deleteButton.setImage(UIImage(named: "delete-row-white"), for: .normal)
        
        lessonName.minimumScaleFactor = 1
        lessonName.font = .systemFont16Semibold
        lessonName.text = "Dmitriy Melnik"
        lessonName.textColor = .white
        lessonName.translatesAutoresizingMaskIntoConstraints = false
        
        
        roundedContentView.layer.shadowColor = UIColor.black.cgColor
        roundedContentView.layer.shadowOpacity = 0.12
        roundedContentView.layer.shadowOffset = .zero
        roundedContentView.layer.shadowRadius = 10
        
        
        firstTask.font = .systemFont14Regular
//        secondTask.font = .systemFont14Regular
        
        roundedContentView.layer.cornerRadius = 20
        markAsDoneButton.layer.cornerRadius = 7
        
        personProfileImage.backgroundColor = .systemGray
        secondTaskMark.backgroundColor = .systemGray
        verticalLineView.backgroundColor = .systemYellow
        roundedCheckMarkView.backgroundColor = .systemYellow
        markAsDoneButton.backgroundColor = .white
        
        roundedView.backgroundColor = .white
        roundedView.layer.borderWidth = 2
        roundedView.layer.borderColor = UIColor.systemYellow.cgColor
        
        markAsDoneButton.setTitleColor(.black, for: .normal)
        markAsDoneButton.titleLabel?.font = .systemFont14Medium
        
        firstTask.textColor = .systemGray
//        secondTask.textColor = .systemGray
        roundedContentView.backgroundColor = .systemYellow
        
        
        markAsDoneButton.setTitle("Marked as done", for: .normal)
        
        firstTask.text = "Presentation about Franch in 16 cen..."
//        secondTask.text = "Write essay about king Spain Georg ..."
        //        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        contentView.addSubview(roundedContentView)
        contentView.addSubview(roundedView)
        contentView.addSubview(verticalLineView)
        contentView.addSubview(roundedCheckMarkView)
        
        
        roundedContentView.addSubview(lessonName)
        roundedContentView.addSubview(firstTask)
//        roundedContentView.addSubview(secondTask)
        roundedContentView.addSubview(personProfileImage)
        roundedContentView.addSubview(secondTaskMark)
        roundedContentView.addSubview(markAsDoneButton)
        roundedContentView.addSubview(deleteButton)
                
        
        
        // right 40
        // left 40
        // heigt = width - 180
        //
        
        roundedContentView.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(60)
            $0.right.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.equalTo(self.frame.width - 200)
            $0.width.equalTo(self.frame.width - 30)
            
        }
        
        lessonName.snp.makeConstraints {
            $0.left.equalTo(personProfileImage.snp.right).offset(8)
            $0.top.equalTo(roundedContentView.snp.top).offset(8)
        }
        
        personProfileImage.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(8)
            $0.top.equalTo(roundedContentView.snp.top).offset(8)
            $0.height.equalTo(65)
            $0.width.equalTo(65)
        }
        
//        secondTaskMark.snp.makeConstraints {
//            $0.left.equalTo(roundedContentView.snp.left).offset(14)
//            $0.top.equalTo(roundedContentView.snp.top).offset(59)
//            $0.height.equalTo(3)
//            $0.width.equalTo(3)
//        }
        
        firstTask.snp.makeConstraints {
            $0.left.equalTo(personProfileImage.snp.right).offset(8)
            $0.right.equalTo(roundedContentView.snp.right).offset(-14)
            $0.centerY.equalTo(personProfileImage.snp.centerY)
        }
        
//        secondTask.snp.makeConstraints {
//            $0.left.equalTo(personProfileImage.snp.right).offset(8)
//            $0.right.equalTo(roundedContentView.snp.right).offset(-14)
//            $0.top.equalTo(firstTask.snp.bottom).offset(5)
//        }
        
        markAsDoneButton.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-18)
            $0.bottom.equalTo(roundedContentView.snp.bottom).offset(-9)
            $0.height.equalTo(30)
            $0.width.equalTo(117)
        }
        
        deleteButton.snp.makeConstraints {
//            $0.left.equalTo(roundedContentView.snp.left).offset(14)
            $0.centerX.equalTo(personProfileImage.snp.centerX)
            $0.bottom.equalTo(roundedContentView.snp.bottom).offset(-9)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        verticalLineView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-1)
            $0.top.equalTo(contentView.snp.top).offset(12)
            $0.width.equalTo(2)
        }
        
        roundedView.snp.makeConstraints {
            $0.centerX.equalTo(verticalLineView.snp.centerX)
            $0.top.equalTo(contentView.snp.top)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        roundedCheckMarkView.snp.makeConstraints {
            $0.centerX.equalTo(roundedView.snp.centerX)
            $0.centerY.equalTo(roundedView.snp.centerY)
            $0.height.equalTo(5)
            $0.width.equalTo(5)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
