//
//  SheduleLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import UIKit
import CloudKit

class SheduleLabViewController: UIViewController, TracsImageCellProtocol {
    
    func didTapImageView(for cell: Cell) {
        print("didTapImageView")
        //        let vc = NoteRouter.createModule()
        
        vc2.passDataCompletion = { title, textView in
            self.models.append((title, textView))
            //            self.foreach()
            //            print("models count \(models.count)")
            self.tableView.reloadData()
        }
        
        
        let navigationController = UINavigationController(rootViewController: vc2)
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.present(navigationController, animated: true, completion: {
            print("VC was presented")
        })
        
        self.navigationController?.popToRootViewController(animated: true)
        print("popToRootViewController")
        
    }
    
    
    @objc func addNewNoteButton() {
        print("addNewNoteButton")
        //        let vc = NoteRouter.createModule()
        
        
        
        vc2.passDataCompletion = { title, textView in
            print("CompletionSheduleVCaddNewNoteButton")
            self.models.append((title, textView))
            //            self.foreach()
            //            print("models count \(models.count)")
            self.tableView.reloadData()
            
            
        }
        
        //        vc2.passDataCompletion = { title, textView in
        //            self.models.append((title, textView))
        
        
        
        //                    var int = 3
        //                    if self.some.contains(where: { int in
        //                        <#code#>
        //                    })
        
        //            print("CompletionSheduleVCaddNewNoteButton")
        //                                self.models.append((title, textView))
        //
        //                                if self.models.contains { (titlee, textVieww) in
        //
        //                                    if title == titlee {
        //                                        print("Yea")
        //                                        return true
        //                                    }
        //
        //                                    return false
        //                                }
        
        
        
        //                    self.models.contains { (titlee, textVieww) in
        //
        //                        if title == titlee {
        //                            print("Yea")
        //                            return true
        //                        }
        //
        //                        return false
        //                    }
        
        
        //            self.foreach()
        //            print("models count \(models.count)")
        
        //            self.tableView.reloadData()
        //        }
        
        let navigationController = UINavigationController(rootViewController: vc2)
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.present(navigationController, animated: true, completion: {
        })
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterSheduleLabProtocol?
    private var tableView = UITableView()
    var indexPath = IndexPath()
    static var typeOf = Int()
    public var typeWith = Int()
    var models: [(title: String, note: String)] = []
    
    var some: [Int] = [1, 2, 3, 4, 5]
    
    let vc2 = NoteViewController()
    //    let addButton
    
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupNavigationController()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
}


extension SheduleLabViewController: PresenterToViewSheduleLabProtocol{
    // TODO: Implement View Output Methods
}


extension SheduleLabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        print("indexPath.row \(indexPath.row)")
        
        switch indexPath.row {
        case indexPath.row:
            
            //            print("case indexPath.row \(indexPath.row)")
            
            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            cell.firstTask.text = models[indexPath.row].note
            cell.lessonName.text = models[indexPath.row].title
            cell.delegate = self
            return cell
            
            
            //        case 1:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            ////            noteVc.completion?({ first, firs in
            ////                print("good")
            ////            })
            //            return cell
            //        case 2:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
            //        case 3:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
            //        case 4:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
            //        case 5:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
            //        case 6:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
            //        case 7:
            //            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            //            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func setupNavigationController() {
        //        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "plus"),
                style: .done,
                target: self,
                action: #selector(addNewNoteButton)
            )
        ]
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return presenter?.numberOfRowsInSection() ?? 0
        //        print("models count \(models.count)")
        
        
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("didSelectRowAt \(indexPath.row)")
        self.indexPath = indexPath
        
        ///
        ///
        ///
        //        let currentModel = models[indexPath.row]
        //
        //
        //        vc2.titleField.text = currentModel.title
        //        vc2.note.text = currentModel.note
        //
        //
        //        if let title = vc2.titleField.text, title != currentModel.title || vc2.note.text != currentModel.note {
        //            print("ififififififif \(models.count)")
        //            vc2.passDataCompletion = { title, textView in
        //                print("CompletionSheduleVCDidSelectRow")
        //                self.models.remove(at: indexPath.row)//((title, textView), at: indexPath.row)
        //                self.models.insert((title, textView), at: indexPath.row)
        //
        //                self.tableView.reloadData()
        //            }
        //        } else {
        //            print("elseelseelse \(vc2.titleField.text)")
        //
        //            print("elseelseelse \(models.count)")
        //        }
        //
        //
        //
        //        let vc2 = NoteViewController()
        //        vc2.passDataCompletion = { title, textView in
        //            self.models.append((title, textView))
        //            //            self.foreach()
        //            //            print("models count \(models.count)")
        //            self.tableView.reloadData()
        
        ///
        ///
        let navigationController = UINavigationController(rootViewController: vc2)
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.present(navigationController, animated: true, completion: {
        })
        //        }
    }
}










extension SheduleLabViewController {
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.allowsSelectionDuringEditing = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseDescriptionCell.self, forCellReuseIdentifier: "\(BaseDescriptionCell.self)")
        tableView.register(NoteCell.self, forCellReuseIdentifier: "\(NoteCell.self)")
        tableView.register(SheduleCell.self, forCellReuseIdentifier: "\(SheduleCell.self)")
    }
    
    
    func checkNouteRevTwo() {
        checkNote(at: indexPath)
    }
    
    func checkNote(at indexPath: IndexPath) {
        
        let currentModel = models[indexPath.row]
        
        
        vc2.titleField.text = currentModel.title
        vc2.note.text = currentModel.note
        
        if let title = vc2.titleField.text, title != currentModel.title || vc2.note.text != currentModel.note {
            print("ififififififif \(models.count)")
            vc2.passDataCompletion = { title, textView in
                print("CompletionSheduleVCDidSelectRow")
                self.models.remove(at: indexPath.row)//((title, textView), at: indexPath.row)
                self.models.insert((title, textView), at: indexPath.row)
                
                self.tableView.reloadData()
            }
        } else {
            print("elseelseelse \(models.count)")
        }
    }
}
