//
//  AuthService.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 28.10.2021.
//

import Foundation
import GoogleSignIn
import Firebase

class AuthService: NSObject, ObservableObject {
    
    @Published var authStatus: SignInState = .initial
    @Published var user: UserDataKeeper
    var completionHandler: ((SignInState, Error?) -> Void)? = nil
    
    init(dataKeeper: UserDataKeeper) {
        self.user = dataKeeper
        super.init()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func signIn() {
        
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
        else {
            completionHandler?(.signedIn, nil)
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()

        do {
          try Auth.auth().signOut()

            self.authStatus = .signedOut
            self.user.clear()
            completionHandler?(.signedOut, nil)
        } catch let signOutError as NSError {
          print(signOutError.localizedDescription)
        }
    }
    
    func checkAuth() {
        if (GIDSignIn.sharedInstance().hasPreviousSignIn()) {
            GIDSignIn.sharedInstance().restorePreviousSignIn()
        }
        else {
            self.authStatus = .signedOut
            self.completionHandler?(.signedOut, nil)
        }
    }
}

extension AuthService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
          firebaseAuthentication(withUser: user)
        } else {
            self.authStatus = .signedOut
            self.completionHandler?(.signedOut, error)
        }
    }
    
    private func firebaseAuthentication(withUser user: GIDGoogleUser) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

          Auth.auth().signIn(with: credential) { (result, error) in
              if let error = error {
                  print(error.localizedDescription)
                  self.authStatus = .signedOut
                  self.completionHandler?(.signedOut, error)
              } else {
                  guard let result = result else {return}
                  let user = UserDataKeeper(email: result.user.email!, uid: result.user.uid)
                  self.authStatus = .signedIn
                  self.user.create(user: user)
                  self.completionHandler?(.signedIn, nil)
            }
          }
        }
    }
}
