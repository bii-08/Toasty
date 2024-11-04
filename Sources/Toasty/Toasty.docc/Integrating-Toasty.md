# Integrating Toasty into Your View

Toasty is a customizable pop-up toast message for SwiftUI, designed to provide quick feedback or notifications to users.

## Overview

Toasty makes it easy to display brief, customizable messages as overlays, improving user experience by delivering real-time information.


## Usage
To integrate Toasty, simply import the package, create a toast message, and control its visibility with a state variable.

```swift
import SwiftUI
import Toasty

struct SwiftUIView: View {
    
    /// State variable to manage the visibility of the toast message.
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
        /// Attaches a `Toasty` view as an overlay toast message.
        .toast(toastView: Toasty(toast: Toast(title: "Warning",
                                              message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
                                              duration: 1, 
                                              position: .top, 
                                              type: .warning), 
                          showToast: $showingToast))
    }
}
```

