//
//  ViewController.swift
//  TQSlistView
//
//  Created by tqs on 2018/4/11.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit
//轻量型点击切换分类
class ViewController: UIViewController {
   var pageViewController:UIPageViewController!
   let arr = ["香蕉","苹果","橘子","哈密瓜","西瓜","红心柚子"]
   fileprivate lazy var arrVC:[TQSListViewController?] = {
      var arrVC = [TQSListViewController?]()
      for i in 0 ..< self.arr.count{
         let vc = TQSListViewController()
         vc.str = self.arr[i]
         arrVC.append(vc)
      }
      return arrVC
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
      addChildViewController(pageViewController)
      view.addSubview(pageViewController.view)
      self.pageViewController.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
      //当我们向我们的视图控制器容器中添加（或者删除）子视图控制器后，必须调用该方法，告诉iOS，已经完成添加（或删除）子控制器的操作
      self.pageViewController.didMove(toParentViewController: self)
      
      if let firstVC = arrVC.first{
         self.pageViewController.setViewControllers([firstVC!], direction: .reverse, animated: false, completion: nil)
      }
      
      let slview = TQSlidingList(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 50))
      slview.makeUI(listData: arr,height:49,font:15,color:UIColor.blue )
      slview.btnedBlock = { [weak self] index in
         if let firstVC = self?.arrVC[index]{
            self?.pageViewController.setViewControllers([firstVC], direction: .reverse, animated: false, completion: nil)
         }
      }
      self.view.addSubview(slview)
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}
/*
 UIViewController容器接口
 
 在调用[父视图控制器 addChildViewController:子视图控制器]之前，无需显式调用[子视图控制器 willMoveToParentViewController:父视图控制器]方法，因为已经默认调用了。
 在调用[父视图控制器 addChildViewController:子视图控制器]之后，要仅接着调用[子视图控制器 didMoveToParentViewController:父视图控制器]方法。
 在调用[子视图控制器 removeFromParentViewController]之前，必须先调用[子视图控制器 willMoveToParentViewController:nil]。
 在调用[子视图控制器 removeFromParentViewController]之后，无需显式调用[子视图控制器didMoveToParentViewController:父视图控制器]，因为已经默认调用了。
 在调用transitionFromViewController之前，调用[fromController willMoveToParentViewController:nil]。
 在调用transitionFromViewController之后，调用[toController didMoveToParentViewController:父视图控制器]
 */
