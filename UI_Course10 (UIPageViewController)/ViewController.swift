//
//  ViewController.swift
//  UI_Course10 (UIPageViewController)
//
//  Created by Александр Тарасов on 17/05/2019.
//  Copyright © 2019 Aleksandr Tarasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
        
    }
    
    func startPresentation() {
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageVC") as? PageVC {   //идентификатор для page VC
                
                present(pageViewController, animated: true, completion: nil)
            }
        }      
}

    
}


