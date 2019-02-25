//
//  API.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-02-03.
//  Copyright © 2019 Flipper. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import UIKit

struct Database {
    static let firestore = Firestore.firestore()
}


struct References {
    
    static let users = Database.firestore.collection("users")
    
    static let tickets = Database.firestore.collection("tickets")
    
}




struct API {
    
    struct Authentication {
        
        static func currentUser() -> User? {
            guard let user = Auth.auth().currentUser else { return nil }
            return user
        }
        
        static func getUserID() -> String {
            guard let user = Auth.auth().currentUser else { return "nil" }
            return user.uid
        }
        
        static func getUserEmail() -> String {
            guard let user = Auth.auth().currentUser else { return "nil" }
            guard let userEmail = user.email else { return "nil" }
            return userEmail
        }
        
        static func isLoggedIn() -> Bool {
            if Auth.auth().currentUser != nil {
                return true
            }
            else {
                return false
            }
        }
        
        static func logIn(withEmail email: String, password: String, _ callback: ((Error?) -> ())? = nil){
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let e = error{
                    callback?(e)
                    return
                }
                callback?(nil)
            }
        }
        
        static func signUp(firstName: String, lastName: String, email: String, password: String, _ callback: ((Error?) -> ())? = nil){
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let e = error{
                    callback?(e)
                    return
                }
                callback?(nil)
            }
            API.Authentication.logOut()
            API.Authentication.logIn(withEmail: email, password: password)
            API.Users.Write.createUser(firstName: firstName, lastName: lastName, email: email)
        }
        
        static func logOut() -> Bool {
            do {
                try Auth.auth().signOut()
                return true
            }
            catch {
                return false
            }
        }
        
        static func sendEmailVerification(_ callback: ((Error?) -> ())? = nil){
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                callback?(error)
            })
        }
        
        static func reloadUser(_ callback: ((Error?) -> ())? = nil){
            Auth.auth().currentUser?.reload(completion: { (error) in
                callback?(error)
            })
        }
        
        static func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                callback?(error)
            }
        }
    }
    
    
    
    
    
    
    
    struct Users {
        
        struct Read {
            
            static func getProfileInformation(_ callback: ((Error?) -> ())? = nil) {
                let profile = References.users.getDocuments(completion: { (snapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in snapshot!.documents {
                            let docId = document.documentID
                            let email = document.get("email") as! String
                            let firstName = document.get("firstName") as! String
                            let lastName = document.get("lastName") as! String
                            let userID = document.get("userID") as! String
                            print("\(userID)")
                            print("\(API.Authentication.currentUser()?.uid)")
                            if API.Authentication.currentUser()?.uid == docId {
                                API.Authentication.getUserEmail()
                                API.Authentication.getUserID()
                        
                                
                            }
                        }
                    }
                })
            }
            
        }
        
        
        
        struct Write {
            
            static func createUser(firstName: String, lastName: String, email: String) {
                References.users.addDocument(data: [
                    "email" : email,
                    "firstName" : firstName,
                    "lastName" : lastName,
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID")
                    }
                }
            }
            
            static func addUserID() {
                References.users.addDocument(data: [
                    "" : ""
                ])
                
            }
            
        }
        
    }
    
}

