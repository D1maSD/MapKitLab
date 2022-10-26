//
//  PlayerViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import MusicKit
import CoreData


class PlayerViewController: ViewController {
    
    private var topShade = UIButton()
    private var songPreview = UIImageView()
    private var sougName = UILabel()
    private var groupName = UILabel()
    private var moreButton = RoundButton()
    private var musicTrackBar = UIView()
    private var playTrackButton = UIButton()
    private var previousTrackButton = UIButton()
    private var nextTrackButton = UIButton()
    private var topView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playTrackButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        nextTrackButton.addTarget(self, action: #selector(load), for: .touchUpInside)
        
        // #1 link for AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // #2 create context
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        // #3 create entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: "UserEntitiy", in: context)
        
        // #4 create object
        let managedObject = NSManagedObject(entity: entityDescription ?? NSEntityDescription(), insertInto: context)
        
        //#5 set value
        
        managedObject.setValue("@mail.ru", forKey: "email")
        managedObject.setValue(21, forKey: "age")
        
        let mail = managedObject.value(forKey: "email")
        let age = managedObject.value(forKey: "age")
        print("\(mail)\(age)")
        
        //#6 save data
        appDelegate.saveContext()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                print(" age - \(result.value(forKey: "age")) \(result.value(forKey: "email"))")
            }
        } catch {
            print(error)
        }
        
        // delete all записей
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                context.delete(result)
            }
        } catch {
            print(error)
        }
        
    }
    
    override func setup() {
        super.setup()
    }
    
    @objc func tapped() {
        let user = UserEntitiy(context: AppDelegate.viewContext)
        user.age = 55
        user.email = "the best"
        user.password = "best"
        user.id = UUID().uuidString
    }
    
    @objc func load() {
        let request: NSFetchRequest<UserEntitiy> = UserEntitiy.fetchRequest()
        let email = "the best"
        request.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let user = try AppDelegate.viewContext.fetch(request)
            groupName.text = user.first?.id
            
        } catch {
            print(error)
        }
    }
    
    
    override func setupUI() {
        super.setupUI()
        self.view.backgroundColor = .systemGray
        self.songPreview.backgroundColor = .systemGreen
        self.songPreview.layer.cornerRadius = 12
        moreButton.backgroundColor = .systemGreen
        moreButton.setImage(UIImage(named: "more-horizontal"), for: .normal)
        previousTrackButton.setImage(UIImage(named: "previous_track"), for: .normal)
        nextTrackButton.setImage(UIImage(named: "next_track"), for: .normal)
        playTrackButton.setImage(UIImage(named: "play_track"), for: .normal)
        
        sougName.font = .systemFont25Semibold
        sougName.text = "It's on You"
        sougName.textColor = .black
        
        musicTrackBar.backgroundColor = .systemRed
        
        groupName.font = .systemFont25Light
        groupName.text = "U2"
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        view.addSubview(songPreview)
        songPreview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sougName)
        sougName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(musicTrackBar)
        musicTrackBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(groupName)
        groupName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(playTrackButton)
        playTrackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(previousTrackButton)
        previousTrackButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextTrackButton)
        nextTrackButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        songPreview.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(30)
            $0.right.equalTo(view.snp.right).offset(-30)
            $0.height.equalTo(self.view.frame.width - 100)
            $0.top.equalTo(view.snp.top).offset(100)
        }
        
        sougName.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(songPreview.snp.bottom).offset(50)
        }
        
        groupName.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(sougName.snp.bottom).offset(5)
        }
        
        moreButton.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-40)
            $0.top.equalTo(songPreview.snp.bottom).offset(65)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
        
        musicTrackBar.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-40)
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(groupName.snp.bottom).offset(40)
            $0.height.equalTo(2)
        }
        
        
        
        playTrackButton.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(musicTrackBar.snp.bottom).offset(40)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
        }

        previousTrackButton.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(60)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
            $0.centerY.equalTo(playTrackButton.snp.centerY)
        }

        nextTrackButton.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-60)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
            $0.centerY.equalTo(playTrackButton.snp.centerY)
        }
    }
    
}
