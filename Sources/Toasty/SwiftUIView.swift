//
//  SwiftUIView.swift
//  
//
//  Created by LUU THANH TAM on 2024/08/13.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var showingToast = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Hello")
                    Button("Show toast") {
                        showingToast = true
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Testing")
        }
        .toast(toastView: Toasty(toast: Toast(title: "Warning", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", duration: 1, position: .top, type: .warning), showToast: $showingToast))
    }
}

#Preview {
    SwiftUIView()
}
