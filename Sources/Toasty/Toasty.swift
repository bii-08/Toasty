// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct Toasty: View {
    @Environment(\.colorScheme) private var colorScheme
    var toast: Toast
    @Binding public var showToast: Bool
    
    public init(toast: Toast, showToast: Binding<Bool>) {
        self.toast = toast
        self._showToast = showToast
    }
   
    public var body: some View {
        
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: toast.type.icon)
                .foregroundColor(toast.type.themeColor)
                .font(Font.title)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(toast.title)
                    .font(Font.title2.bold())
                    .foregroundColor(toast.type.themeColor)
                Text(toast.message)
                    .font(Font.subheadline)
            }
            
            Spacer(minLength: 10)
            
            if toast.duration == nil {
                Button {
                    withAnimation {
                        showToast = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(toast.type.themeColor)
                }
            }
        }
        .padding()
        .frame(minWidth: 200)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(colorScheme == .light ? Color.white : Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(toast.type.themeColor.opacity(0.5), lineWidth: 2)
                )
        )
        .padding(.horizontal, 16)
        .overlay {
            HStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(toast.type.themeColor)
                    .frame(maxWidth: 10)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 10,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
                
                Text("")
                    .padding(.horizontal, 172)
            }
        }
        .onAppear {
            if let duration = toast.duration {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        showToast = false
                    }
                }
            }
        }
    }
}
