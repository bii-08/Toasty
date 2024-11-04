//
//  SwiftUIView.swift
//  
//
//  Created by LUU THANH TAM on 2024/08/13.
//

import SwiftUI

/// A SwiftUI view demonstrating the usage of a toast message overlay.
///
/// `SwiftUIView` showcases how to present a toast notification within a SwiftUI view.
/// The view contains a button that, when tapped, toggles the display of a toast message.
/// The toast appears at the specified position and duration, displaying a title and message.
///
/// ## Overview
/// This view contains a `NavigationStack` with a button that sets a `showingToast` state variable to `true` when tapped,
/// triggering a toast overlay. The `toast` modifier is used to attach a `Toasty` instance to the view, enabling the display
/// of a customizable toast message.
///
/// - Properties:
///   - `showingToast`: A private `@State` variable that controls the visibility of the toast.
///   - `toastView`: A `Toasty` instance passed to the `.toast()` modifier, configured to display the toast's title,
///      message, duration, position, and type.
///
/// ### Example Usage
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         SwiftUIView()
///     }
/// }
/// ```
/// In this example, the `SwiftUIView` shows a button labeled "Show toast" that, when tapped, displays a warning toast at the top of the screen.
///
/// ## Parameters
/// - `Toast`: Configured with a title of "Warning", a message, a duration of 1 second, and a `Position` of `.top`.
/// - `Toasty`: The toast view instance, which is controlled by `showingToast` to toggle visibility.
///
/// This layout can be easily extended to other views by applying the `.toast()` modifier with different `Toasty` configurations.
struct SwiftUIView: View {
    
    /// State variable to manage the visibility of the toast message.
    @State private var showingToast = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Hello")
                    Button(!showingToast ? "Show toast" : "") {
                        showingToast = true
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Testing")
        }
        /// Attaches a `Toasty` view as an overlay toast message.
        .toast(toastView: Toasty(toast: Toast(title: "Warning", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", duration: 1, position: .top, type: .warning), showToast: $showingToast))
    }
}

#Preview {
    SwiftUIView()
}
