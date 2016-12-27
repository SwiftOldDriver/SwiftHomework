//
//  ViewController.swift
//  EmojiMachine
//
//  Created by daemon on 2016/11/29.
//  Copyright © 2016年 daemon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    fileprivate let emojis = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    
    fileprivate var dataArray1 = [Int]()
    fileprivate var dataArray2 = [Int]()
    fileprivate var dataArray3 = [Int]()

    @IBOutlet weak var emojiPickerView: UIPickerView! {
        didSet {
            emojiPickerView.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var goButton: UIButton! {
        didSet {
            goButton.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var tipsLabel: UILabel! {
        didSet {
            tipsLabel.text = ""
        }
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        let randomInt1 = Int(arc4random()) % 90 + 3
        let randomInt2 = Int(arc4random()) % 90 + 3
        let randomInt3 = Int(arc4random()) % 90 + 3
        
        emojiPickerView.selectRow(randomInt1, inComponent: 0, animated: true)
        emojiPickerView.selectRow(randomInt2, inComponent: 1, animated: true)
        emojiPickerView.selectRow(randomInt3, inComponent: 2, animated: true)
        
        if (dataArray1[randomInt1] == dataArray2[randomInt2] &&
            dataArray2[randomInt2] == dataArray3[randomInt3]) {
            tipsLabel.text = "Bingo!"
        } else {
            tipsLabel.text = "💔"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1..<100 {
            dataArray1.append(Int(arc4random()%10))
            dataArray2.append(Int(arc4random()%10))
            dataArray3.append(Int(arc4random()%10))
        }
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
    }
    
    // MARK: UIPickerViewDelegate && UIPickerViewDataSource
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        
        if component == 0 {
            pickerLabel.text = emojis[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = emojis[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = emojis[(Int)(dataArray3[row])]
        }
        
        return pickerLabel
    }
}

