//
//  ViewController.swift
//  UserDefauktsAutoLoginExampel
//
//  Created by undhad kaushik on 07/02/23.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logindetails = UserDefaults.standard.value(forKey: "username")
        if logindetails != nil {
            userNameTextFeild.text = UserDefaults.standard.value(forKey: "username") as? String
            passwordTextFeild.text = UserDefaults.standard.value(forKey: "password") as? String
        }
    }

    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if userNameTextFeild.text == ""{
            displayAlert(messege: "please Enter Username")
        } else if passwordTextFeild.text == ""{
                displayAlert(messege: "please enter password")
        } else if passwordTextFeild.text?.count ?? 0 != 10{
            displayAlert(messege: "please enter only 10 digits")
        }
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageView = storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
        self.navigationController?.pushViewController(homePageView, animated: true)

           
            
        
    }
    
    
    private func displayAlert(messege: String){
        let alert: UIAlertController = UIAlertController(title: "error", message: messege, preferredStyle: .alert)
        let yesButton: UIAlertAction = UIAlertAction(title: "Yes", style: .default){ button in
            UserDefaults.standard.set(self.userNameTextFeild.text!, forKey: "username")
            UserDefaults.standard.set(self.passwordTextFeild.text!, forKey: "password")
            self.performSegue(withIdentifier: "segue1", sender: self)
            
        }
        let noButton:UIAlertAction = UIAlertAction(title: "No", style: .default)
            print("not save login details ")
        self.performSegue(withIdentifier: "segue1", sender: self)

        
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(yesButton)
            alert.addAction(noButton)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segue1"{
//            let save = segue.destination as! HomePageViewController
//            save.users = "username-> , \(userNameTextFeild.text!)"
//            save.password = "password-> , \(passwordTextFeild.text!)"
//        }
//    }
}

