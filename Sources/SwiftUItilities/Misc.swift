//
//  File.swift
//  
//
//  Created by cristian on 06/12/2021.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {

    
    
    /// Hidden navigation link.
    /// Pass the destination view as first parametter
    /// and a binding bool
    func navigationLink<Destination: View>(
        _ destination: Destination,
        _ isActive: Binding<Bool>
    ) -> some View {
        self
            .background(
                EmptyNavigationLink(
                    destination: destination,
                    isActive: isActive
                )
            )
    }
    
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

    
    func backgroundColor(_ color: Color) -> some View {
        self.background(color.fullScreen())
    }
    
   
    
    @ViewBuilder
    func spaceWrap() -> some View {
        Spacer()
        self
        Spacer()
    }
    
    func scrollify(_ axis: Axis.Set = .vertical) -> some View {
        
        ScrollView(axis, showsIndicators: false) {
            self
        }
    }
    
    
    /// Injects view inside an overlay modifer applied to a Spacer().
    /// Use when you need an Hstack with three elements and need to have
    /// one of them at the center. Apply to the other two
    func injectInSpacer() -> some View {
        Spacer()
            .overlay(self)
    }

    

    @ViewBuilder
    func displayIf(_ condition: Bool) -> some View {
        
        if condition {
            self
        } else {
            EmptyView()
        }
    }
    
    
    func isHidden(_ value: Bool) -> some View {
        modifier(HiddenModifier(isHidden: value))
    }
    
    
}

