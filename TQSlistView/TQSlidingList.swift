//
//  TQSlidingList.swift
//  TQSlidingList
//
//  Created by tqs on 2018/4/11.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class TQSlidingList: UIView {
   
   var arrData:[String]?
   var btnedBlock:((Int)->())?
   var slidLabel:UILabel!
   var count_s = 0
   var rowHeight:CGFloat = 0
   var fontSize:CGFloat = 13
   var titleColor:UIColor = .green
   /*
    系统颜色不够靓，可使用自定义色值
    */
   //var customColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
   
   lazy var slidingListView:UIView = {
      let backView = UIView(frame: self.bounds)
      let width_s = Int(self.frame.size.width/CGFloat(count_s))
      for i in 0..<count_s{
         
         let btn = UIButton(type: .custom)
         btn.frame = CGRect(x: width_s*i, y: 0, width: width_s, height: Int(rowHeight))
         btn.setTitle(arrData?[i], for: .normal)
         btn.titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize)
         btn.tag = i + 10
         btn.isSelected = false
         btn.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
         btn.setTitleColor(UIColor.black, for: .normal)
         btn.setTitleColor(self.titleColor, for: .selected)
         
         backView.addSubview(btn)
         if btn.tag == 10{
            btn.isSelected = true
            DispatchQueue.main.async {
               self.slidLabel = UILabel(frame: CGRect(x:(btn.titleLabel?.frame.minX)!,y:self.rowHeight,width: (btn.titleLabel?.frame.width)!, height:1))
               self.slidLabel.backgroundColor = self.titleColor
               backView.addSubview(self.slidLabel)
               
            }
         }
      }
      return backView
   }()
   
   override init(frame: CGRect){
      super.init(frame: frame)
      self.backgroundColor = UIColor.white
   }
   
   func makeUI(listData arr:[String]?,height:CGFloat,font:CGFloat,color:UIColor){
      self.arrData = arr
      self.count_s = arr?.count ?? 0
      self.rowHeight = height
      self.fontSize = font
      self.titleColor = color
      //self.customColor = color
      self.addSubview(slidingListView)
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   @objc func clickBtn(_ btn:UIButton){
      for i in 0..<self.count_s{
         let b = self.viewWithTag(i + 10) as! UIButton
         b.isSelected = false
      }
      let min = CGFloat(btn.tag - 10)*(self.frame.size.width/CGFloat(self.count_s))
      UIView.animate(withDuration: 0.3) {
         btn.isSelected = true
         self.slidLabel.frame.origin.x = (btn.titleLabel?.frame.minX)! + min
         self.slidLabel.frame.size.width = (btn.titleLabel?.frame.width)!
      }
      self.btnedBlock?(btn.tag - 10)
   }
   
}
