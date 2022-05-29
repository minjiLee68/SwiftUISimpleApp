//
//  Memo.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import Foundation

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var contents: String
    let insertDate: Date
    
    init(id: UUID = UUID(), contents: String, insertDate: Date = Date()) {
        self.id = id
        self.contents = contents
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.id == rhs.id
    }
}
