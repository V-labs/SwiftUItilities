//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// Wrapps view inside a navigationLink.
    /// Pass destination view as a parametter.
    func onTap<Destination: View>(navigateTo destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
        }
    }
    
    /// Wrapps view inside a navigationLink.
    /// Accepts a function that returns a view as a parameter.
    func onTap<Destination: View>(navigateTo destination: () -> Destination) -> some View {
        NavigationLink(destination: destination()) {
            self
        }
    }
    
    /// Wraps the view around a Button View
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
