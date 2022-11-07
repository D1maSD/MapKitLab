//
//  NoteViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import UIKit

class NoteViewController: UIViewController {
    
    let textView = UITextView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.frame = self.view.bounds
    }

    // MARK: - Properties
    var presenter: ViewToPresenterNoteProtocol?
    
}

extension NoteViewController: PresenterToViewNoteProtocol{
    // TODO: Implement View Output Methods
}
