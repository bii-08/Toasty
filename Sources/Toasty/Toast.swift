//
//  File.swift
//  
//
//  Created by LUU THANH TAM on 2024/08/13.
//

import SwiftUI

/// Representation of a toast message
///
/// This `Toast` struct can be used to create short, informational messages that pop up in the UI,
/// providing feedback or alerts to the user. By setting properties such as the display duration,
/// position, and type, you can customize the appearance and behavior of each toast.
///
/// - Parameters:
///   - title: The title of the toast, typically a short, descriptive summary.
///   - message: The main content of the toast, providing instructions or feedback.
///   - duration: The amount of time (in seconds) the toast will remain visible. If `nil`, a default duration will be used.
///   - position: The position on the screen where the toast will appear, such as top, center, or bottom.
///   - type: The style of the toast, which can indicate different alert levels, like success, warning, or error.
///
/// - Note:
///  - Equatable: The `Toast` struct conforms to `Equatable`, allowing comparison of two `Toast` instances based on the `title` property.
public struct Toast: Equatable {
    // Compares two `Toast` instances based on their `title` properties.
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.title == rhs.title
    }
    
    /// The title of the toast.
    public var title: String
    /// The main message content of the toast.
    public var message: String
    /// Optional duration in seconds for which the toast will be displayed.
    public var duration: Double?
    /// Position of the toast on the screen.
    public var position: Position
    /// Type of the toast indicating its style, such as success, warning, or error.
    public var type: ToastType
    
    /// Initializes a new `Toast` instance with the given properties.
        ///
        /// - Parameters:
        ///   - title: The title of the toast.
        ///   - message: The alert message or instruction to display.
        ///   - duration: The time (in seconds) the toast remains visible. Defaults to `nil` if not provided.
        ///   - position: The position on the screen where the toast will appear.
        ///   - type: The type of toast, indicating its style or purpose.
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
