//
//  CurrentNewsViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit
import SnapKit

class CurrentNewsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLayout()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterCurrentNewsProtocol?
    
    private var newsImageView = UIImageView()
    private var newsTitle = UILabel()
    private var newsText = UILabel()
    
    private var firstButton = NewsButton()
    private var secondButton = NewsButton()
    private var thirdButton = NewsButton()
    private var fourButton = NewsButton()
    private var fiveButton = NewsButton()
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    
    func setupNavigationController() {
//        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "share"),
                style: .done,
                target: self,
                action: nil
            ),
            
            UIBarButtonItem(
                image: UIImage(named: "smile"),
                style: .done,
                target: self,
                action: nil
            ),
            
            UIBarButtonItem(
                image: UIImage(named: "message"),
                style: .done,
                target: self,
                action: nil
            )
        ]
    }
    
     func setupUI() {
        self.view.backgroundColor = .white
        
        fiveButton.backgroundColor = .systemGray
        secondButton.backgroundColor = .systemGray
        thirdButton.backgroundColor = .systemGray
        fourButton.backgroundColor = .systemGray
        firstButton.backgroundColor = .systemGray
        
        firstButton.setImage(UIImage(named: "smile"), for: .normal)
        secondButton.setImage(UIImage(named: "face-sad"), for: .normal)
        thirdButton.setImage(UIImage(named: "star"), for: .normal)
        fourButton.setImage(UIImage(named: "message"), for: .normal)
        fiveButton.setImage(UIImage(named: "share"), for: .normal)
        
        newsTitle.text = "20+ человек которые связались с сайтами объявлений, и там их ошарашили по полной"
        newsTitle.font = .systemFont35Heavy
        newsTitle.numberOfLines = 6
        
        newsText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
        newsText.font = .text18SemiboldFont
        newsText.numberOfLines = 10
        
        
    }
    
    func setupLayout() {
        
        addSubview()
        
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        let buttonTwo = UIButton(frame: CGRect(x: 10, y: 1000, width: 100, height: 100))
        
        contentView.addSubview(button)
        contentView.addSubview(buttonTwo)
        button.backgroundColor = .systemGray
        buttonTwo.backgroundColor = .systemGray
        
//        scrollView = UIScrollView(frame: self.view.bounds)
        
        scrollView.backgroundColor = .red
        contentView.backgroundColor = .systemGreen
        contentView.backgroundColor = .systemGreen
       
        view.addSubview(scrollView)
        view.addSubview(contentView)
        scrollView.addSubview(contentView)
        

        self.newsImageView.backgroundColor = .systemGreen
        self.newsImageView.layer.cornerRadius = 12
        
        
        scrollView.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(20)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.top.equalTo(view.snp.top).offset(20)
            $0.bottom.equalTo(view.snp.bottom).offset(-20)
//            $0.height.equalTo(2000)
        }
        
        contentView.snp.makeConstraints {
            $0.left.equalTo(scrollView.snp.left).offset(20)
            $0.right.equalTo(scrollView.snp.right).offset(-20)
            $0.top.equalTo(scrollView.snp.top).offset(20)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }

        newsImageView.snp.makeConstraints {
            $0.left.equalTo(scrollView.snp.left).offset(20)
            $0.right.equalTo(scrollView.snp.right).offset(-20)
            $0.top.equalTo(scrollView.snp.top).offset(200)
            $0.height.equalTo(self.view.frame.width - 100)
        }
        
        newsTitle.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalTo(newsImageView.snp.bottom).offset(10)
        }
        
        newsText.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalTo(firstButton.snp.bottom).offset(20)
        }
        
        firstButton.snp.makeConstraints {
            $0.right.equalTo(secondButton.snp.left).offset(-9)
            $0.centerY.equalTo(thirdButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        secondButton.snp.makeConstraints {
            $0.right.equalTo(thirdButton.snp.left).offset(-9)
            $0.centerY.equalTo(thirdButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        thirdButton.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(newsTitle.snp.bottom).offset(20)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        fourButton.snp.makeConstraints {
            $0.left.equalTo(thirdButton.snp.right).offset(9)
            $0.centerY.equalTo(thirdButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        fiveButton.snp.makeConstraints {
            $0.left.equalTo(fourButton.snp.right).offset(9)
            $0.centerY.equalTo(thirdButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        
    }
    
    func addSubview() {
        
        
        contentView.addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(newsText)
        newsText.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(fourButton)
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(fiveButton)
        fiveButton.translatesAutoresizingMaskIntoConstraints = false
        
//        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension CurrentNewsViewController: PresenterToViewCurrentNewsProtocol{
    // TODO: Implement View Output Methods
}



















