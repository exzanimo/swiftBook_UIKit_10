//
//  ContentViewController.swift
//  UI_Course10 (UIPageViewController)
//
//  Created by Александр Тарасов on 17/05/2019.
//  Copyright © 2019 Aleksandr Tarasov. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var closePresentation: UIButton!
    
    var presentText = ""
    var emoji = ""
    var curentPage = 0 //номер текущей страницы
    var numberOfPages = 0 //кол-во страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        if curentPage == numberOfPages - 1 {
            closePresentation.isHidden = false }
            else {
                pageControl.currentPage = curentPage
            }
        
    }
    
    @IBAction func closePresentationButton(_ sender: UIButton) {
        
        let pageVC = storyboard?.instantiateViewController(withIdentifier: "PageVC") as? PageVC
        pageVC?.closePage()
        dismiss(animated: true, completion: nil) //закрытие страницы
    }
}   
