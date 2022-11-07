//
//  SignUpService.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 02.11.2022.
//

import UIKit
import CoreData


class SignUpService {
    // MARK: - signUp
   static func signUp(
        loginField: String,
        emailField: String,
        passwordField: String,
        confirmField: String
    ) -> TypesOfAlert {
        
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        
        print("signUpTapped  4  ")
        //MARK: Check fields are not empty
        
        guard emailField !=  "" || passwordField !=  "" || loginField !=  "" || confirmField != "" else {
            
            return .emptyFields
            
        }
        
        //        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserEntitiy", into: context) as NSManagedObject
        //        newUser.setValue(loginField.text, forKey: "id")
        //        newUser.setValue(passwordField.text, forKey: "password")
        
        
        
        
        //MARK: Check fields are not empty
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                
                let mail = result.value(forKey: "email") as? String
                let password = result.value(forKey: "password") as? String
                
                if emailField == mail || passwordField == password {
                    
                    return .accountExists
                    
                }
            }
            
            
            if ((passwordField.range(of: passwordPattern, options: .regularExpression) != nil) && (emailField.range(of: emailRegEx, options: .regularExpression) != nil)) {
                
                //MARK: if passwordField == confirmField
                if (passwordField == confirmField) {
                    
                    
                    //MARK: password.setValue  mail.setValue
                    newUser.setValue(passwordField, forKey: "password")
                    newUser.setValue(emailField, forKey: "email")
                    newUser.setValue(loginField, forKey: "id")
                    try context.save()
                    
                    print(newUser)
                    print("OBJECT SAVED.")
                    
                    return .regSuccessful
                    
                    
                    //MARK: alert Password Error
                } else {
                    return .passwordError
                }
            }
            
            else {
                return .registrationFailed
                
            }
            
        } catch let error as NSError {
            
            print(error.localizedDescription)
            return .randomSystemError
        }
    }
}

