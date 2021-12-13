//
//  File.swift
//  
//
//  Created by Cristian Rojas on 13/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// @todo: Delete overlay methods ecause they conflict with native method
    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback. Accepts a closure that returns  a View
    func overlay<Content: View>(alignment: Alignment = .center, @ViewBuilder content: () -> Content ) -> some View {
        self.overlay(content(), alignment: alignment)
    }

    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback
    func overlay<Content: View>(alignment: Alignment = .center, content: Content) -> some View {
        self.overlay(content, alignment: alignment)
    }


    func overlayView<Content: View>(alignment: Alignment = .center, @ViewBuilder content: () -> Content ) -> some View {
        self.overlay(content(), alignment: alignment)
    }

    /// .overlay(alignment:, content:) is weirdly only avaialbe from iOS 15.
    /// This method provides a fallback
    func overlayView<Content: View>(alignment: Alignment = .center, content: Content) -> some View {
        self.overlay(content, alignment: alignment)
    }
}
