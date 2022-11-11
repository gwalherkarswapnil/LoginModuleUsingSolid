//
//  LoginViewModel.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 30/09/22.
//
import GoogleSignIn
import AuthenticationServices
import Foundation
import FBSDKLoginKit
struct LoginViewModel {
    
}
//
//class LoginUser {
//    func login() {
//        let data = authenticareUserViaAPI()
//        let user = decodeUser(data: data)
//        saveUserInfoOnDatabase(user: user)
//    }
//
//    private func authenticareUserViaAPI() -> Data {
//        // Call server to authenticate and return user's info
//        return Data()
//    }
//
//    private func decodeUser(data: Data) -> LoginModel {
//        // Decode data (Codable protocol) into User object
//        return LoginModel()
//    }
//
//    private func saveUserInfoOnDatabase(user: LoginModel) {
//        // Save User info onto database
//    }
//}
//
enum LoginType {
    case facebook
    case google
    case apilogin
}

class LoginUser {
    let oAuthHandler: OAuthHandler
    let decodeHandler: DecodeHandler
    let databaseHandler: DataBaseHandler
    
    init(oAuthHandler: OAuthHandler, decodeHandler: DecodeHandler, databaseHandler: DataBaseHandler) {
        self.oAuthHandler = oAuthHandler
        self.decodeHandler = decodeHandler
        self.databaseHandler = databaseHandler
    }
    
    func login(_ loginType: LoginType) {
        switch loginType {
        case .facebook: break
        case .google: break
        case .apilogin:
            let data = oAuthHandler.authenticareUserViaAPI()
            let user = decodeHandler.decodeUser(data: data)
            databaseHandler.saveUserInfoOnDatabase(user: user)
        }
    }
}
 
class OAuthHandler {
    func authenticareUserViaAPI() -> Data {
        // Call server to authenticate and return user's info
        return Data()
    }
 
}
struct FaceBookLoginHandler {
    func logIntoFacebook(viewController: UIViewController) {
     let permission = [ Permission.publicProfile,Permission.email]
        
        LoginManager().logIn(permissions:permission , viewController: viewController) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, _ ):
                print("LoggedIn Successfully to FB")
            }
        }
    }
    
}
import GoogleSignIn
import AuthenticationServices
class GoogleLoginHandler: NSObject, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }

    func logIntoGoogleAccount(viewController: UIViewController) {
        guard let delegate = viewController as? GIDSignInDelegate else {return}
        GIDSignIn.sharedInstance().delegate = delegate
        GIDSignIn.sharedInstance().presentingViewController = viewController
        GIDSignIn.sharedInstance().signIn()
    }
}
 
class DecodeHandler {
    func decodeUser(data: Data) -> LoginModel {
        // Decode data (Codable protocol) into User object
        return LoginModel()
    }
}
 
class DataBaseHandler {
    func saveUserInfoOnDatabase(user: LoginModel) {
        // Save User info onto database
    }
}

