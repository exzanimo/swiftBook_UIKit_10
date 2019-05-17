//
//  PageVC.swift
//  UI_Course10 (UIPageViewController)
//
//  Created by Александр Тарасов on 17/05/2019.
//  Copyright © 2019 Aleksandr Tarasov. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентации, рассказывающая о том, что наше приложение из себя представляет",
        "Вторая страница презентации, рассказывающая о какой-то удобной фишке приложения",
        "Третья страница презентации тоже рассказывающая о чем-то интересном",
        "Ну и наконец последняя страница презентации с напуствием  в добрый путь!",
        ""
    ]
    
    let emojiArray = ["🤪","😲","👌🏻","😎", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
            }
    }


    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {

        guard index >= 0 else {return nil}
        guard index < presentScreenContent.count else {
//            let userDefaults = UserDefaults.standard
//            userDefaults.set(true, forKey: "presentationWasViewed") //произвольный ключ
//            dismiss(animated: true, completion: nil) //закрытие страницы
            
            closePage()


            return nil}
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentVC") as? ContentViewController else {return nil} //"ContentVC" - идентификатор в Storyboard ID


        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.curentPage = index
        contentViewController.numberOfPages = presentScreenContent.count

        return contentViewController

    }
    
    func closePage() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "presentationWasViewed") //произвольный ключ
        dismiss(animated: true, completion: nil) //закрытие страницы

    }
}

extension PageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber -= 1


        return showViewControllerAtIndex(pageNumber)

    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber += 1

        return showViewControllerAtIndex(pageNumber)
    }

    
}
