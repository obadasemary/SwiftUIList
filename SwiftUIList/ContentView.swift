//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Abdelrahman Mohamed on 3.09.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        List {
//
//            ForEach(1...10, id: \.self) { index in
//                Text("Item \(index)")
//            }
//        }
        List(1...10, id: \.self) {
            Text("Item \($0)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
