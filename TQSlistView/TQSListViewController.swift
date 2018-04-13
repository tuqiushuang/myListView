//
//  TQSListViewController.swift
//  TQSlistView
//
//  Created by tqs on 2018/4/13.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class TQSListViewController: UIViewController {
   
   var label = UILabel()
   var str = ""
   override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
      label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
      label.center = self.view.center
      label.textColor = UIColor.black
      label.textAlignment = .center
      self.view.addSubview(label)
      // Do any additional setup after loading the view.
   }
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      label.text = str + "view"
   }
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
   /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
   
}
