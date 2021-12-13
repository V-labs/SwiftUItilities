//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// Navigate to view
    func onTap<Destination: View>(navigateTo destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
        }
    }
    
    func onTap<Destination: View>(navigateTo destination: () -> Destination) -> some View {
        NavigationLink(destination: destination()) {
            self
        }
    }
    
    /// Wraps the view around a Button View
    /// making it tappable.
    /// Use insted of native .onTapGesture to keep
    /// visual feedback (opacity transition on tap)
    func onTap(perform: @escaping () -> ()) -> some View {
        Button {
            perform()
        } label: {
            self
        }
    }
}
