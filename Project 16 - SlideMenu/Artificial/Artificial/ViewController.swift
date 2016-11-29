//
//  ViewController.swift
//  Artificial
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

enum Algorithm {
    case bfs
    case dfs
    case ai
}

enum GameState {
    case current
    case completed
    case saved
}

enum GameLevel: Int {
    case easy = 3
    case normal
    case difficult
}


class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var isAutoGaming: Bool = false
    //矩阵阶数
    var matrixOrder: GameLevel = .easy
    var image: [UIImage] = []
    var state: GameState = .current
    var selectedAlgorithm:Algorithm = .bfs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startGame(_ sender: Any) {
    }
    

    @IBAction func startBFirstSearch(_ sender: Any) {
        
    }
   
   
    @IBAction func startDFirstSearch(_ sender: Any) {
        
        
    }
    
    @IBAction func startAISearch(_ sender: Any) {
        
    }

    
    func showCurrentStatusOnView(){
        let size = view.bounds.width / CGFloat(matrixOrder.rawValue)
        let index = 0
        for row in 0..<matrixOrder.rawValue {
            for row in 0..<matrixOrder.rawValue {
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

