//
//  NoteViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import UIKit
import SnapKit


class NoteViewController: UIViewController {
    
    
    let titleField = UITextField()
    let note = UITextView()
    
    public var passDataCompletion: ((String, String) -> ())?
    
    
    let cancelButton = UIButton(title: "Cancel", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    let saveButton = UIButton(title: "Save", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
        titleField.borderStyle = .line
        titleField.layer.cornerRadius = 5
        
        self.view.backgroundColor = .white
        setUpUI()
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterNoteProtocol?
    
    
    
    func setUpUI() {
        saveButton.addTarget(self, action: #selector(saveDidTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelDidTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelDidTapped), for: .touchUpInside)
    }
    
    func setupLayout() {
        self.view.addSubview(cancelButton)
        self.view.addSubview(saveButton)
        self.view.addSubview(titleField)
        self.view.addSubview(note)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        titleField.translatesAutoresizingMaskIntoConstraints = false
        note.translatesAutoresizingMaskIntoConstraints = false
        
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(50)
            $0.height.equalTo(20)
            $0.width.equalTo(120)
            $0.right.equalTo(self.view.snp.right)
        }
        
        titleField.snp.makeConstraints {
            $0.top.equalTo(saveButton.snp.bottom).offset(40)
            $0.height.equalTo(30)
            $0.right.equalTo(self.view.snp.right).offset(-30)
            $0.left.equalTo(self.view.snp.left).offset(30)
        }
        
        note.snp.makeConstraints {
            $0.top.equalTo(titleField.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-10)
            $0.left.equalTo(self.view.snp.left).offset(10)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-10)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(50)
            $0.height.equalTo(20)
            $0.width.equalTo(120)
            $0.left.equalTo(self.view.snp.left)
        }
    }
    
    @objc func saveDidTapped() {
        print("saveDidTapped")
        if let title = titleField.text, !title.isEmpty, !note.text.isEmpty {
            passDataCompletion?(title, note.text)
            
            if self.presentingViewController != nil {
//                print("presentingViewController != nil")
                    self.dismiss(animated: true, completion: {
                       self.navigationController!.popToRootViewController(animated: true)
                    })
            }
            else {
//                print("presentingViewController == nil")
                    self.navigationController!.popToRootViewController(animated: true)
            }
        }
    }
    
    @objc func cancelDidTapped() {
        print("cancelDidTapped")
        
        let navController = self.presentingViewController as? UINavigationController
        
        self.dismiss(animated: true) {
            navController?.popToRootViewController(animated: true)
        }
//        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
//            print("dismiss")
//        })
        
//        self.navigationController?.dismiss(animated: true, completion: {
//            print("dismiss")
//        })
    }
    
}

extension NoteViewController: PresenterToViewNoteProtocol{
    // TODO: Implement View Output Methods
}
