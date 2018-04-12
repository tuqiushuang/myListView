//
//  ViewController.swift
//  TQSlistView
//
//  Created by tqs on 2018/4/11.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   var fruitName = ""
   override func viewDidLoad() {
      super.viewDidLoad()
      let arr = ["香蕉","苹果","橘子","哈密瓜","西瓜","红心柚子"]
      let slview = TQSlidingList(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 50))
      slview.makeUI(listData: arr,height:49,font:15,color:UIColor.blue )
      slview.btnedBlock = { [weak self] index in
         self?.fruitName = arr[index]
         print(arr[index])
      }
      self.view.addSubview(slview)
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

