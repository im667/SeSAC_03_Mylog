//
//  Memo.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/14.
//

import Foundation
//열거형
enum Category: Int{
    case business = 0, personal, others
    
    var description: String{
        switch self {
        case .business:
            return "업무"
        case .personal:
            return "개인"
        case .others:
            return "기타"
            }
        }
    }


struct Memo{
    var content: String
    var category: Category //열거형을 직접 담을 수 있다
}
