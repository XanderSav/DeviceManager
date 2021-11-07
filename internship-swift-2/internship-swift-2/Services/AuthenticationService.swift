//
//  AuthenticationService.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation
import GoogleSignIn
import Firebase

class AuthenticationService: NSObject, ObservableObject {
    @Published var authStatus: SignInState = .initial
    @Published var user: User
    
    var errorHandler: ((Error?) -> Void)? = nil
    
    init(user: User) {
        self.user = user
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
            self.authStatus = .signedIn
        }
    }
    
    func checkAuth() {
        if (GIDSignIn.sharedInstance().hasPreviousSignIn()) {
            GIDSignIn.sharedInstance().restorePreviousSignIn()
        }
        else {
            self.authStatus = .signedOut
        }
    }
}

extension AuthenticationService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
          firebaseAuthentication(withUser: user)
        } else {
            self.errorHandler?(error)
            self.authStatus = .signedOut
        }
    }
    
    private func firebaseAuthentication(withUser user: GIDGoogleUser) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

          Auth.auth().signIn(with: credential) { (result, error) in
              if let error = error {
                  self.errorHandler?(error)
                  self.authStatus = .signedOut
              } else {
                  guard let result = result else {
                      self.authStatus = .signedOut
                      return
                  }
                  self.authStatus = .signedIn
                  self.user = User(email: result.user.email!, uid: result.user.uid)
            }
          }
        }
    }
}

