//
//  ComposeScene.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    @Binding var showComposer: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $content)
                    .background(Color.yellow)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Simple Memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    DismissButton(show: $showComposer)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SaveButton(show: $showComposer, content: $content)
                }
            }
        }
    }
}

fileprivate struct DismissButton: View {
    @Binding var show: Bool

    var body: some View {
        Button("취소") {
            self.show = false
        }
        .foregroundColor(Color.black)
    }
}

fileprivate struct SaveButton: View {
    @Binding var show: Bool
    
    @EnvironmentObject var store: MemoStore
    @Binding var content: String

    var body: some View {
        Button("저장") {
            self.show = false
            self.store.insert(memo: self.content)
        }
        .foregroundColor(Color.black)
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(showComposer: .constant(false))
            .environmentObject(MemoStore())
    }
}
