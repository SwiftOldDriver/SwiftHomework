//
//  JSPathSearch.swift
//  Artificial
//
//  Created by 陈铭嘉 on 2016/11/29.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

@objc protocol JXPathSearcherStatus {
    /// 父状态
    var parentStatus: JXPathSearcherStatus?  { get set }
    /// 此状态的唯一标识
    func statusIdentifer() -> String
    /// 取所有邻近状态(子状态)，排除父状态。每一个状态都需要给parentStatus赋值。
    func childStatus() -> [JXPathSearcherStatus]
}

/// 路径搜索
class JSPathSearcher: NSObject {
    
    var startStatus: JXPathSearcherStatus? {
        didSet {
            startStatus?.parentStatus = nil
        }
    }
    var targetStatus: JXPathSearcherStatus? {
        didSet {
            targetStatus?.parentStatus = nil
        }
    }
    var equalComparator:((JXPathSearcherStatus,JXPathSearcherStatus)->Bool)?
    
    /// 开始搜索，返回搜索结果。无法搜索时返回nil
    func search() -> Array<AnyObject>? {
        guard let _ = startStatus, let _ = targetStatus,let _ = equalComparator else {
            return nil
        }
        return Array<AnyObject>()
    }
    
    /// 构建路径。isLast表示传入的status是否路径的最后一个元素
    func constructPathWithStatus(status: JXPathSearcherStatus?,isLast: Bool) -> Array<AnyObject>? {
        var status = status
        var path = Array<AnyObject>()
        if status != nil {
            return path
        }
        repeat{
            if isLast {
                path.insert(status!, at: 0)
            }else{
                path.append(status!)
            }
            status = status!.parentStatus
        }while(status != nil)
        return path
    }
}
