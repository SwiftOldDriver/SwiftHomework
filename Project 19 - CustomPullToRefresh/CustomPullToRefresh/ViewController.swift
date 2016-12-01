//
//  ViewController.swift
//  CustomPullToRefresh
//
//  Created by Yasin on 2016/11/29.
//  Copyright © 2016年 Yasin. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["😂", "🤗", "😳", "😌", "😊"]
    
    let refreshController = UIRefreshControl()
    var customView: UIView!
    var isAnimating = false
    
    var labelsArray: [UILabel] = []
    var currentColorIndex = 0
    var currentLabelIndex = 0
    
    var timer: Timer?
    
    let transformColors: [UIColor] = [.magenta, .brown, .yellow, .red, .green, .blue, .orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 60
        
        refreshController.backgroundColor = UIColor.clear
        refreshController.tintColor = UIColor.clear
        tableView.addSubview(refreshController)
        loadCustomRefreshContents()
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            startRefresh(then: doSomething)
        }
    }
    
    
    func loadCustomRefreshContents() {
        customView = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)?.last as! UIView
        customView.frame = refreshController.bounds

        for i in 1...12  {
            if let label = customView.viewWithTag(i) as? UILabel{
                labelsArray.append(label)
            }
        }
        
        refreshController.addSubview(customView)
    }

    func doSomething() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.finished), userInfo: nil, repeats: true)
    }
    
    func finished() {
        endRefresh()
        
        timer?.invalidate()
        timer = nil
    }
    
    func startRefresh(then:() -> ()) {
        if !isAnimating {
            animateRefreshStep1()
            then()
        }
        
    }
    
    func endRefresh() {
        refreshController.endRefreshing()
    }
    
    
    func animateRefreshStep1() {
        
        isAnimating = true
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getCurrentColor()
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveLinear, animations: { () -> Void in
                self.labelsArray[self.currentLabelIndex].transform = .identity
                self.labelsArray[self.currentLabelIndex].textColor = .black
                
            }, completion: { (finished) -> Void in
                if self.refreshController.isRefreshing {
                    self.currentLabelIndex += 1
                    
                    if self.currentLabelIndex < self.labelsArray.count {
                        self.animateRefreshStep1()
                    } else {
                        self.currentLabelIndex = 0
                        self.animateRefreshStep2()
                    }
                } else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                }
                
            })
        })
    }
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: .curveLinear, animations: { () -> Void in
            
            self.labelsArray.forEach({ (label) in
                label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: { () -> Void in
                self.labelsArray.forEach({ (label) in
                    label.transform = .identity
                })
                
            }, completion: { (finished) -> Void in
                if self.refreshController.isRefreshing {
                    self.animateRefreshStep1()
                }
                else {
                    self.isAnimating = false
                    self.labelsArray.forEach({ (label) in
                        label.textColor = .black
                        label.transform = .identity
                    })
                }
            })
        })
    }
    
    func getCurrentColor() -> UIColor {
        //获取当前颜色
        let returnColor = transformColors[currentColorIndex]
        //设置下一个颜色的游标
        currentColorIndex = (currentColorIndex + 1)%transformColors.count
        return returnColor
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 35)
        cell.textLabel?.textAlignment = .center
        return cell
    }
}

