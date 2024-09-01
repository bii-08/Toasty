//
//  File.swift
//  
//
//  Created by LUU THANH TAM on 2024/08/13.
//

import SwiftUI

public struct Toast: Equatable {
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.title == rhs.title
    }
    
    var title: String
    var message: String
    var duration: Double?
    var position: Position
    var type: ToastType
    
    public init(title: String, message: String, duration: Double? = nil, position: Position, type: ToastType) {
        self.title = title
        self.message = message
        self.duration = duration
        self.position = position
        self.type = type
    }
}

public enum Position {
    case bottom
    case top
    case center
}

public enum ToastType {
    case error
    case warning
    case success
    case info
    case custom(Color, String)
    
    var themeColor: Color {
        switch self {
        case .error: 
            return Color.red
        case .warning: 
            return Color.orange
        case .success: 
            return Color.green
        case .info: 
            return Color.blue
        case .custom(let color, _):
            return color
        }
    }
    
    var icon: String {
        switch self {
        case .error:
            return "xmark.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .success:
            return "checkmark.circle.fill"
        case .info:
            return "info.circle.fill"
        case .custom(_, let iconName):
            return iconName
        }
    }
}
