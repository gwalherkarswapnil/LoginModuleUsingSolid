//
//  LoginViewController.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 30/09/22.
//

import UIKit
class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    private var viewModel: LoginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialUI()
    }
    
    private func setUpInitialUI() {
        // Do any additional setup after loading the view.
        setImageBackground()
        let customColor = UIColor.white
        username.layer.borderColor = customColor.cgColor
        password.layer.borderColor = customColor.cgColor
        
        username.layer.borderWidth = 1.0
        password.layer.borderWidth = 1.0
    }
    
    func setImageBackground(){
        let background = UIImage(named: "design_six/login-6")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
    }

}

extension LoginViewController {

    // 1
    private func signinUser(email: String, password: String) {
        let url = URL(string: "https://my-api.com")!
        let json = ["email": email, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
     
        let task = URLSession.shared.dataTask(with: request)  { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.showErrorAlert(message: error.localizedDescription)
                }
            }
            guard let data = data else {
                self.showErrorAlert(message: "sorry, could not log in, try later")
                return
            }
            // 2
            let user = try! JSONDecoder().decode(UserM.self, from: data)
            self.log(user: user)
            DispatchQueue.main.async {
                self.showWelcomeMessage(user: user)
            }
        }
        task.resume()
    }

    private func showErrorAlert(message: String) {
        // logic to show an error alert
    }

    private func showWelcomeMessage(user: UserM) {
        // logic to show a welcome message
    }

    // 3
    private func log(user: UserM) {
        // log user logic
    }
}

struct UserM: Codable{

}
