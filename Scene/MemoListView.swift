//
//  ContentView.swift
//  SimpleMemo
//
//  Created by 이민지 on 2022/05/29.
//

import SwiftUI

struct MemoListView: View {
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var dateFormatter: DateFormatter
    
    @State var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .navigationTitle("Simple Memo")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    ModalButton(show: $showComposer)
                }
            }
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: $showComposer)
            })
            
            //plus 버튼을 누르면 showComposer가 true로 변형되고 ispresented가 true일 때 ComposeScene뷰가 모달로 띄워진다.
        }
    }
}

fileprivate struct ModalButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
        .foregroundColor(Color.black)
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
