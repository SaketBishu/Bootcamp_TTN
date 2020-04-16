//
//  RootPageViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 11/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController,UIPageViewControllerDataSource {
        
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let ViewC1 = sb.instantiateViewController(withIdentifier: "RedViewController")
        let ViewC2 = sb.instantiateViewController(withIdentifier: "YellowViewController")
        let ViewC3 = sb.instantiateViewController(withIdentifier: "GreenViewController")
        
        return [ViewC1,ViewC2,ViewC3]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerList.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = viewControllerList.firstIndex(of: viewController) ?? 0
        
        if(currentIndex <= 0){
            return nil
        }
       return viewControllerList[currentIndex-1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         let currentIndex = viewControllerList.firstIndex(of: viewController) ?? 0
        if(currentIndex >= viewControllerList.count - 1){
            return nil
        }
        
        return viewControllerList[currentIndex+1]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
