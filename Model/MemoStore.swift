//
//  MemoStore.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(contents: "simple memo 1"),
            Memo(contents: "simple memo 2"),
            Memo(contents: "simple memo 3"),
            Memo(contents: "simple memo 4")
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(contents: memo), at: 0)
    }
    
    func update(memo: Memo?, contents: String) {
        guard let memo = memo else { return }
        memo.contents = contents
    }
    
    func delete(memo: Memo) {
        self.list.removeAll { $0 == memo }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            self.list.remove(at: index)
        }
    }
}
