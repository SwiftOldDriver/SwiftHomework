//
//  ViewController.swift
//  CustomFont
//
//  Created by Yasin on 2016/11/25.
//  Copyright © 2016年 Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = ["30 Days Swift",
                "这些字体特别适合打「奋斗」和「理想」",
                "谢谢「造字工房」，本案例不涉及商业使用",
                "使用到造字工房劲黑体，致黑体，童心体",
                "呵呵，再见🤗 See you next Project",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    let fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "edundot",
                     "Gaspar Regular"]
    
    var fontNamesIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = fontNames[fontNamesIndex]
        
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        
        changeFontButton.layer.cornerRadius = changeFontButton.frame.width / 2
    }
    
    //固定高度可以直接设置tableView.rowHeight，在storyboard里面设置了
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 35
//    }
    
    
    //默认sections是1，可以省略不写
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:fontNames[fontNamesIndex], size:16)
        return cell
    }
    
    @IBAction func changeFont(_ sender: Any) {
        //循环切换下一种字体
        fontNamesIndex = (fontNamesIndex + 1) % fontNames.count
        print(fontNames[fontNamesIndex])
        title = fontNames[fontNamesIndex]
        fontTableView.reloadData()
    }
}

