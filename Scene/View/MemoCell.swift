//
//  MemoCell.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.contents)
                .font(.body)
                .lineLimit(1) //내용이 길다면 뒷부분 생략..
            
            Text("\(memo.insertDate, formatter: self.formatter)")
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(contents: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
