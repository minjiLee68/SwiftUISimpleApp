//
//  File.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    } ()
}

extension DateFormatter: ObservableObject {
    
}
