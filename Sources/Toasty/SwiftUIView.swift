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
        .toast(toastView: Toasty(toast: Toast(title: "Warning", message: "This is the message for this error. This is the message for this error.",duration: 1, position: .top, type: .warning), showToast: $showingToast))
    }
}

#Preview {
    SwiftUIView()
}
