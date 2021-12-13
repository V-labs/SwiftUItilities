//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// Returns a view taking the whole screen width & height available.
    /// Ignores safe area
    func fullScreen() -> some View {
        self
            .frame(width: UIScreen.main.bounds.size.width)
            .frame(height: UIScreen.main.bounds.size.height)
            .edgesIgnoringSafeArea(.all)
    }
    
    /// Returns a view with same width and height for the specified value.
    /// Prevents repetition when we need both values to be the same.
    func size(_ value: CGFloat) -> some View {
        self
            .frame(width: value)
            .frame(height: value)
    }
    
    func height(_ value: CGFloat) -> some View {
        self.frame(height: value)
    }
    
    func width(_ value: CGFloat) -> some View {
        self.frame(width: value)
    }
    
    func maxHeight(_ value: CGFloat) -> some View {
        self.frame(width: value)
    }
    
    func maxWidth(_ value: CGFloat) -> some View {
        self.frame(maxWidth: .infinity)
    }
}
