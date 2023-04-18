//
//  HomePageViewController.swift
//  UserDefauktsAutoLoginExampel
//
//  Created by undhad kaushik on 07/02/23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var myLabelText: UILabel!
    @IBOutlet weak var myLabelPassText: UILabel!
    
    var users: String = ""
    var password: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabelText.text = users
        myLabelPassText.text = password
        

        // Do any additional setup after loading the view.
    }
    

   

}
