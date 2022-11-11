////
////  NetworkingManager.swift
////  LoginModuleUsingSolid
////
////  Created by macmini41 on 11/10/22.
////
//
//import Foundation
///*A class should have one and only one reason to change OR A class should have only one responsibility
//
//We have a class NetworkingManager which you can also infer responsible for networking related stuff. This class responsibility includes:
//*/
//protocol Networking {
//
//}
//class NetworkingManager: Networking {
//    private let session: URLSession
//    static var shared = NetworkingManager()
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
//
//    //MARK: - Methods
//    func request(_ endPoint: EndPointUrls, competion: (Result <Data, NetworkError> )) -> Void {
//        let urlRequest = URLRequest(url: URL(string: EndPointUrls.baseURL)!)
//        session.dataTask(with: urlRequest) { Data, response, error in
//
//        }
//    }
//}
//struct EndPointUrls {
//    static let baseURL = "https://jsonplaceholder.typicode.com/posts"
//    static let users = "/users"
//    static let feelings = "/feelings"
//    static let trophies = "/trophies"
//    static let today = "/_today"
//    static let  diary = "/diary"
//    static let posts = "/posts"
//}
//
//
//import Foundation
//enum NetworkError {
//    case invalidUrl
//}
//enum Result <Data, NetworkError>{
//    case failure
//}
