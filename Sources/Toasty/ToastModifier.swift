//
//  File.swift
//  
//
//  Created by LUU THANH TAM on 2024/08/13.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    
    var toastView: Toasty
    
    func body(content: Content) -> some View {
        
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                ZStack {
                    if toastView.showToast {
                        toastView
                            .offset(y: toastView.toast.position == .top ? -300 : (toastView.toast.position == .bottom ? 300 : 0))
                    }
                }
            }
    }
}

extension View {
    func toast(toastView: Toasty) -> some View {
        self.modifier(ToastModifier.init(toastView: toastView))
    }
}
